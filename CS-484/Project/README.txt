You should rename test images like '0.jpg' to '00.jpg' and '1.jpg' to '01.jpg' for the code to run properly.

For edge boxes we will provide 'model.yml' file and you should put this file in the folder with the implementation in it. 

You should put code and required files in the folder that has the train and test folders in it.

We use tensorflow, keras, pandas, numpy, six, sklearn, opencv, and matplotlib. You should install all of them.

If you have gpu that has at least cuda=5.0 support, make sure you have Anaconda and then install tensorflow-gpu and keras-gpu with:
	conda install -c anaconda tensorflow-gpu 
	conda install -c anaconda keras-gpu

If you have only cpu power, use:
	pip install tensorflow 
	pip install keras

For opencv, use: 
	pip install opencv-python
	pip install opencv-contrib-python 

For other libraries:
	pip install six
	pip install sklearn
	pip install numpy 
	pip install pandas 