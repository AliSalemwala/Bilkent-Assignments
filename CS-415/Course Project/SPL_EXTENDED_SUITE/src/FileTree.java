import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Container;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.event.MouseEvent;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Collections;
import java.util.Scanner;
import java.util.Vector;

import javax.swing.BoxLayout;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTabbedPane;
import javax.swing.JTextArea;
import javax.swing.JTree;
import javax.swing.event.TreeSelectionEvent;
import javax.swing.event.TreeSelectionListener;
import javax.swing.tree.DefaultMutableTreeNode;


public class FileTree extends JPanel {
    Font font = new Font("Courier", Font.PLAIN,12);
	public JTextArea txtarea;
	public JTree tree;
	public String selectedPath="";
  public FileTree(MainPanel mainPanel, JTabbedPane tabbedPane, File dir) {
	  
	  addMouseListener(mainPanel);
    setLayout(new BorderLayout());
    setLocation(0,0);
    // Make a tree list with all the nodes, and make it a JTree
    tree = new JTree(addNodes(null, dir));
    tree.addMouseListener(mainPanel);
    // Add a listener
    tree.addTreeSelectionListener(new TreeSelectionListener() {
      public void valueChanged(TreeSelectionEvent e) {
      
    	  DefaultMutableTreeNode node = (DefaultMutableTreeNode) e
            .getPath().getLastPathComponent();
        String str=node.toString();
     	String filePath=node.getParent().toString()+"/"+str;
     	selectedPath=filePath;
     	mainPanel.selectedPath=filePath;
        if(str.substring(str.length()-4, str.length()).equals("java")) {
        	
       
        	String out="";
        	File classFile=new File(filePath);
        	try {
				Scanner fileScan=new Scanner(classFile);
				while(fileScan.hasNextLine())
					out+=fileScan.nextLine()+"\n";
			} catch (FileNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
        	
        	JScrollPane pane=new JScrollPane(txtarea);
        	

       	 txtarea = new JTextArea();
   		txtarea.setText(out);
   		txtarea.setFont(font);
   		txtarea.addMouseListener(mainPanel);
   		txtarea.addKeyListener(mainPanel);
   		mainPanel.txtAreas.add(txtarea);
   		mainPanel.highlight(txtarea);
   		tabbedPane.addTab(str,pane);
        	
        }
      }
    });

    // Lastly, put the JTree into a JScrollPane.
    JScrollPane scrollpane = new JScrollPane();
    scrollpane.getViewport().add(tree);
    add(BorderLayout.CENTER, scrollpane);
  }

  DefaultMutableTreeNode addNodes(DefaultMutableTreeNode curTop, File dir) {
    String curPath = dir.getPath();
    DefaultMutableTreeNode curDir = new DefaultMutableTreeNode(curPath);
    if (curTop != null) { // should only be null at root
      curTop.add(curDir);
    }
    Vector ol = new Vector();
    String[] tmp = dir.list();
    for (int i = 0; i < tmp.length; i++)
      ol.addElement(tmp[i]);
    Collections.sort(ol, String.CASE_INSENSITIVE_ORDER);
    File f;
    Vector files = new Vector();
    // Make two passes, one for Dirs and one for Files. This is #1.
    for (int i = 0; i < ol.size(); i++) {
      String thisObject = (String) ol.elementAt(i);
      String newPath;
      if (curPath.equals("."))
        newPath = thisObject;
      else
        newPath = curPath + File.separator + thisObject;
      if ((f = new File(newPath)).isDirectory())
        addNodes(curDir, f);
      else
        files.addElement(thisObject);
    }
    // Pass two: for files.
    for (int fnum = 0; fnum < files.size(); fnum++)
      curDir.add(new DefaultMutableTreeNode(files.elementAt(fnum)));
    return curDir;
  }

  public Dimension getMinimumSize() {
    return new Dimension(200, 400);
  }

  public Dimension getPreferredSize() {
    return new Dimension(200, 400);
  }


}




           
         
    
    
    
  