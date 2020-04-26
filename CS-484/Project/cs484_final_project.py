import os 
os.environ['KERAS_BACKEND'] = 'tensorflow'
import cv2 
import numpy as np
np.random.seed(2019)
from tensorflow import set_random_seed
set_random_seed(2019)
from  keras.applications import resnet50
import matplotlib.pyplot as plt 
from keras import backend as K
from sklearn.svm import SVC 
import time 
import matplotlib.pyplot as plt 
import pandas as pd
import six
plt.rcParams.update({'font.size': 22})
plt.rcParams.update({"figure.figsize": (16,12)})
import itertools


def padding(img, dimension= 224, channel = 3 ):
    '''
    This function creates zeros padding for non-square colored images 
    '''
    empty = np.zeros((dimension, dimension,channel)).astype(np.int)
    width = img.shape[0]
    height = img.shape[1]
    
    diff_width  = (dimension - width)//2
    diff_height = (dimension - height)//2
    if ( width <= dimension and height <= dimension ):
        
        empty[diff_width:(diff_width+width), diff_height:(diff_height+height),:] = img.astype(np.int)
    elif ( width == dimension and height != dimension):
        
        empty[:, diff_height:(height+diff_height),:] = img.astype(np.int)
        
    elif ( width != dimension and height == dimension):
        empty[ diff_width:(width+diff_width), : ,:] = img.astype(np.int)
        
    return empty

def preprocess(x):
    '''
    This function subtracts imagenet mean from images 
    '''
    x = x.astype(np.float64)
    x[:, :,  0] -= 103.939
    x[:, :,  1] -= 116.779
    x[:, :,  2] -= 123.68
    return x


def resize_image(img, reshape_size= 224):
    '''
    This function resizes image with saving aspect ratio
    '''
    max_shape = np.max(img.shape)
    ratio = (max_shape / reshape_size).astype(np.float64)

    new_width = np.round((img.shape[1] / ratio)).astype(np.int)
    new_height  = np.round((img.shape[0] / ratio)).astype(np.int)
   
    return cv2.resize(img, (new_width, new_height))

def img_op(img):
    '''
    This function apply resizing, padding and removing mean and also enhance channel of image with 4 channel
    '''
    return np.expand_dims(preprocess(padding(resize_image(img))),axis=0)





def area_finder(vertices):
    '''
    This function find area of pizels given four vertices of rectangle
    '''
    one_edge = vertices[2] - vertices[0]
    other_edge = vertices[3] - vertices[1]
    return one_edge * other_edge



def localization_accuracy(ground_truth, can_window):
    '''
    This function find localization accuracy with given to rectangle area(intersect)/ area(union)
    '''
  
    left = max(ground_truth[0],can_window[0])
    right = min(ground_truth[2], can_window[2])
    top = max(ground_truth[1], can_window[1])
    bottom = min(ground_truth[3], can_window[3])
    if ( left < right and top < bottom ):
            intersect_box = left, top, right, bottom

    else : 
        return 0 

    
    area_ground = area_finder(ground_truth)
    area_can = area_finder(can_window)
    area_inter = area_finder(intersect_box)
    
    area_union = area_can + area_ground - area_inter
    return float(area_inter)/float(area_union) 

def plot_conf_matrix(cm, classes, title='Confusion matrix',cmap=plt.cm.Blues):
    '''
    This function plots the confusion matrix 
    '''
   
    plt.imshow(cm, interpolation='nearest', cmap=cmap)
    plt.title(title)
    plt.colorbar()
    tick_marks = np.arange(len(classes))
    plt.xticks(tick_marks, classes, rotation=45)
    plt.yticks(tick_marks, classes)

    fmt = 'd'
    thresh = cm.max() / 2.
    for i, j in itertools.product(range(cm.shape[0]), range(cm.shape[1])):
        plt.text(j, i, format(cm[i, j],  'd'),horizontalalignment="center",color="white" if cm[i, j] > thresh else "black")

    plt.ylabel('True label')
    plt.xlabel('Predicted label')
    plt.rcParams["figure.figsize"] = (16,12)
    plt.tight_layout()
    plt.show()

def data_loader():
    '''
    This function load train images and test images 
    '''
    #read train folder paths
    train_paths = np.array(os.listdir('train{}'.format(os.sep)))
    #read test images path
    test_paths = np.array(os.listdir('test{}images'.format(os.sep)))
    #read absolute test image paths
    test_paths = [ 'test{}images{}{}'.format(os.sep, os.sep, i) for i in test_paths ]
    #conver to absolute path 
    train_img_paths = np.array([ np.array(os.listdir('train/{}'.format(x))) for x in train_paths  ])
    train_imgs_abs_paths = []
    #all train paths 
    for i in range(len(train_img_paths)):
        train_class = []
        for img_path in range(len(train_img_paths[i])):
            train_class.append('train' + os.sep + train_paths[i] + os.sep +  train_img_paths[i][img_path])
        train_imgs_abs_paths.append(np.array(train_class))
    train_imgs_abs_paths = np.array(train_imgs_abs_paths)


    #read train images 
    train_imgs = []
    for i in train_imgs_abs_paths:

        train_class_img = []
        for img in i:

            train_class_img.append(cv2.imread(img))
        train_imgs.append(np.array(train_class_img))
    train_imgs =  np.array(train_imgs)

    #read test images 
    test_imgs = []

    for i in test_paths:
        print(i)
        test_imgs.append(cv2.cvtColor(cv2.imread(i), cv2.COLOR_BGR2RGB))
    test_imgs = np.array(test_imgs)
    return train_imgs, test_imgs



def preprocess_train(train_imgs):
    '''
    This function preprocesses the train images 
    '''
    for i in range(len(train_imgs)):
        for  j  in range(len(train_imgs[i])):

            train_imgs[i][j] = preprocess(padding(resize_image(train_imgs[i][j])))
    return train_imgs

        
def load_bounding_boxes():  
    '''
    This function load boundix boxes 
    '''
    file = open('test/bounding_box.txt','r')
    bounding_boxes = []
    for i in file:
        listx = i.strip().split(', ')
        listx  =  [ int(listx[i]) if i != 0 else listx[i] for i in range(len(listx)) ]

        bounding_boxes.append(listx)
    return bounding_boxes


def load_model():
    '''
    This function loads resnet pretrained neural network model
    '''
    return resnet50.ResNet50(include_top=False, weights='imagenet', input_tensor=None, input_shape=None, pooling='avg', classes=1000)


def get_features(model, train_imgs ):
    '''
    This function creates features from train images 
    '''
    train_features = []

    for classes in train_imgs:
        class_features = []
        for i in range(len(classes)):
            class_features.append(model.predict(np.expand_dims(classes[i],axis=0)))
        train_features.append(np.squeeze(np.array(class_features),axis=1))
    return np.array(train_features)
    


def svm_models(features):
    '''
    This function crearet 10 svm models for 10 different classes
    Params:
        features : that extact from train imgs
    Return :
        svc_models: that 10 binary svm models
    '''
    sizes = []
    X_train = []
    for i in range(10):
        sizes.append(len(features[i]))
        X_train.extend(features[i])
    X_train = np.array(X_train)
    sizes = np.array(sizes)


    svc_models = []
    for i in range(0,10):
        y_train = np.zeros((X_train.shape[0]))
        y_train[np.sum(sizes[:i]): np.sum(sizes[:(i+1)])] = 1
        print(i)

        svc_models.append(SVC(kernel= 'rbf', gamma='auto', probability=True).fit(X_train, y_train ))
    return svc_models

def find_test_results(test_imgs,svc_models,model,bounding_boxes):
    '''
    This function finds test results 
    Params:
        test_imgs : 
        svc_models : 10 differnt svm models 
        bounding_boxes : bounding boxess that given 
    Return :
        accuracies : accuracies of the test images
        founded_classes: founded classes for each test images 
        localization_acc : localization accurasies
    '''
    founded_classes = []
    accuracies = []
    localization_acc= []
    for k in range(100):
        rgb_im = test_imgs[k] 

        im = cv2.cvtColor(rgb_im, cv2.COLOR_RGB2BGR)
        edge_detection = cv2.ximgproc.createStructuredEdgeDetection('model.yml')

        edges = edge_detection.detectEdges(np.float32(rgb_im) / 255.0)

        orimap = edge_detection.computeOrientation(edges)
        edges = edge_detection.edgesNms(edges, orimap)

        edge_boxes = cv2.ximgproc.createEdgeBoxes()

        edge_boxes.setMaxBoxes(50)
        boxes = edge_boxes.getBoundingBoxes(edges, orimap)
        maximum = -1 
        classes = -1 
        box = -1
        for i in range(10):
            for b in boxes:
                x, y, w, h = b
                im_part = im[x:x+w, y:y+h,:]
                if 0 not in im_part.shape:
                    result = svc_models[i].predict_proba(model.predict(img_op(im_part)))[0][1]
                    if result > maximum:
                        print(i, result)
                        if maximum != 1.0:
                            maximum = result
                            classes = i
                            box = b
                        else:
                            break

        x, y, w, h = box            


        founded_box = (x, y, x+w, y+h)

        box2 = bounding_boxes[k][1:]
        x1, y1, x2, y2 = box2
        box_wanted = box2


        accuracies.append(maximum)
        localization_acc.append(localization_accuracy(box_wanted,founded_box))
        founded_classes.append(classes)
        time.sleep(3)
    
    return accuracies, founded_classes, localization_acc

def render_mpl_table(data, col_width=4.0, row_height=0.625, font_size=29,
                     header_color='#40466e', row_colors=['#f1f1f2', 'w'], edge_color='w',
                     bbox=[0, 0, 1, 1], header_columns=0,
                     ax=None, **kwargs):
    '''
    This function plot table
    '''
    if ax is None:
        size = (np.array(data.shape[::-1]) + np.array([0, 1])) * np.array([col_width, row_height])
        fig, ax = plt.subplots(figsize=size)
        ax.axis('off')

    mpl_table = ax.table(cellText=data.values, bbox=bbox, colLabels=data.columns, **kwargs)

    #mpl_table.auto_set_font_size(False)
    mpl_table.set_fontsize(font_size)

    for k, cell in  six.iteritems(mpl_table._cells):
        cell.set_edgecolor(edge_color)
        if k[0] == 0 or k[1] < header_columns:
            cell.set_text_props(weight='bold', color='w')
            cell.set_facecolor(header_color)
        else:
            cell.set_facecolor(row_colors[k[0]%len(row_colors) ])
    return ax

def confusion_matrix_creator(classes):
    '''
    This function creates confusion matrix from predictions 
    '''
    classes = np.array(classes).reshape(10,10)
    conf_matrix = np.zeros(classes.shape).astype(np.int)
    classes = classes[np.argsort(classes[:,0],axis=0).ravel(), :] 
    print(np.histogram(classes[0], range(0,11))[0])
    for i in range(10):
        conf_matrix[i] = ( np.histogram(classes[i], range(0,11))[0] ) 
    return conf_matrix

    


def metrics(conf_matrix):
    '''
    This functions find metrics recall and precision from confusion matrix 
    '''
    TP = np.diag(conf_matrix)
    FP = np.sum(conf_matrix, axis=0) - TP
    FN = np.sum(conf_matrix, axis=1) - TP
    num_classes = 10
    TN = []
    conf = conf_matrix.copy()
    for i in range(num_classes):
        temp = np.delete(conf, i, 0)
        temp = np.delete(temp, i, 1)  
        TN.append(sum(sum(temp)))
    precision = TP/(TP+FP)
    recall = TP/(TP+FN)
    precision = np.append(precision, np.mean(precision))
    recall = np.append(recall, np.mean(recall))
    return precision, recall 

def plot_metric_table(precision, recall):
    '''
    This function plots the table for metrics 
    '''
    class_names =  np.array(['eagle', 'dog', 'cat', 'tiger', 'starfish', 'zebra', 'bison', 'antelope','chimpanzee', 'elephant', 'avg'])
    metrics = np.vstack([class_names,precision,recall])
    data = pd.DataFrame(data=metrics.T)
    data.columns = ["",'Precision', 'Recall']

    data['Precision'] = data['Precision'].astype(np.float32)
    data['Precision'] = data['Precision'].map('{:,.2f}'.format)
    render_mpl_table(data, header_columns=1, col_width=3.0)
    plt.show()

    
def test_edgeboxes(test_imgs, bounding_boxes ):
    '''
    This function test the edge boxes with giving different colors to boxes
    '''
    for k in range(0,100,10):
        rgb_im = test_imgs[k] 
        #edge boxes
        im = cv2.cvtColor(rgb_im, cv2.COLOR_RGB2BGR)
        edge_detection = cv2.ximgproc.createStructuredEdgeDetection('model.yml')

        edges = edge_detection.detectEdges(np.float32(rgb_im) / 255.0)

        orimap = edge_detection.computeOrientation(edges)
        edges = edge_detection.edgesNms(edges, orimap)

        edge_boxes = cv2.ximgproc.createEdgeBoxes()
        #maximum 50 boxes
        edge_boxes.setMaxBoxes(50)
        boxes = edge_boxes.getBoundingBoxes(edges, orimap)

        for b in boxes:
            x, y, w, h = b
            cv2.rectangle(im, (x, y), (x+w, y+h), ( np.random.randint(0,255),  np.random.randint(0,255), np.random.randint(0,255)), 1, cv2.LINE_AA)


        #cv.imshow("edges", edges)
        cv2.imshow("edgeboxes", im)
        cv2.waitKey(0)
        cv2.destroyAllWindows()
    
def test_pipeline(test_imgs,svc_models, model, bounding_boxes ):
    '''
    This function test and shows overall pipeline
    '''
    class_names = np.array(['eagle', 'dog', 'cat', 'tiger', 'starfish', 'zebra', 'bison', 'antelope','chimpanzee', 'elephant'])[[4,9,5,1,6,8,7,2,0,3]]
    for a in range(10):
        for c in range(3):
            k = a * 10 + c 
            print(k)
            rgb_im = test_imgs[k] 

            im = cv2.cvtColor(rgb_im, cv2.COLOR_RGB2BGR)
            edge_detection = cv2.ximgproc.createStructuredEdgeDetection('model.yml')

            edges = edge_detection.detectEdges(np.float32(rgb_im) / 255.0)

            orimap = edge_detection.computeOrientation(edges)
            edges = edge_detection.edgesNms(edges, orimap)

            edge_boxes = cv2.ximgproc.createEdgeBoxes()

            edge_boxes.setMaxBoxes(50)
            boxes = edge_boxes.getBoundingBoxes(edges, orimap)
            maximum = -1 
            classes = 0 
            box = -1
            for i in range(10):
                for b in boxes:
                    x, y, w, h = b
                    im_part = im[x:x+w, y:y+h,:]
                    if 0 not in im_part.shape:
                        result = svc_models[i].predict_proba(model.predict(img_op(im_part)))[0][1]
                        if result > maximum:
                            print(i, result)
                            if maximum != 1.0:
                                maximum = result
                                classes = i
                                box = b
                            else:
                                break

            
            x, y, w, h = box            

            cv2.rectangle(im, (x, y), (x+w, y+h), (0, 0,255), 1, cv2.LINE_AA)
            founded_box = (x, y, x+w, y+h)
            cv2.putText(im,'{}'.format(class_names[a]), (x, y +h - 10 ), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)
            box2 = bounding_boxes[k][1:]
            x1, y1, x2, y2 = box2
            box_wanted = box2
            cv2.rectangle(im, (x1, y1), (x2,y2), (255,0, 0), 1, cv2.LINE_AA)
            
            cv2.imshow("edgeboxes", im)
            cv2.waitKey(0)
            cv2.destroyAllWindows()
print('Images are loading...')
train_imgs, test_imgs = data_loader()
print('Pretrained Model is loading...')
model = load_model()
print('Bounding Boxes are loading...')
bounding_boxes = load_bounding_boxes()
print('Train images preprocessing...')
pre_train_imgs = preprocess_train(train_imgs)
print('Train features are extracting...')
features = get_features(model, pre_train_imgs)
print('SVM Models are creating...')
svc_models = svm_models(features)
print('Test results are loading...')
accuracy, classes, local_accuracy = find_test_results(test_imgs,svc_models,model,bounding_boxes)
print("Localization Accuracies : \n", local_accuracy)
np.save('loc_acc',local_accuracy)
local_accuracy = np.array(local_accuracy)
print('\n\nLocalization accuracies is {}/100', len(local_accuracy[local_accuracy >= 0.5] ))
confusion_matrix = confusion_matrix_creator(classes)
precision, recall = metrics(confusion_matrix)
class_names = ['eagle', 'dog', 'cat', 'tiger', 'starfish', 'zebra', 'bison', 'antelope','chimpanzee', 'elephant']
print('Confusion maxtrix is plotting...')
plot_conf_matrix(confusion_matrix, classes=class_names,title='Confusion matrix Test')
print('Metric table is plotting...')
plot_metric_table(precision, recall)
print('Edge Boxes is plotting...')
test_edgeboxes(test_imgs,bounding_boxes)
print('Pipeline is testing...')
test_pipeline(test_imgs,svc_models,model,bounding_boxes)