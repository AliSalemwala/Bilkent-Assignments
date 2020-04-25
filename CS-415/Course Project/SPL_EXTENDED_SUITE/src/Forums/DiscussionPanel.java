package Forums;

import java.awt.Color;
import java.awt.Desktop;
import java.awt.Font;
import java.awt.Graphics;
import java.util.ArrayList;

import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;



import javax.swing.JTextPane;
import javax.swing.text.SimpleAttributeSet;
import javax.swing.text.StyleConstants;
import javax.swing.text.StyleContext;
import javax.print.attribute.AttributeSet;
import javax.swing.DropMode;
import javax.swing.ImageIcon;
import javax.swing.JSplitPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.JButton;
import javax.swing.JFileChooser;
import javax.swing.JFrame;

import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.awt.event.ActionEvent;
import javax.swing.JTable;

public class DiscussionPanel extends JPanel implements Runnable {

	int yaziX=0;
	JLabel yazi;
	Thread thread;
	ArrayList<Yorum> yorumlar;
	JTextPane  textPane;
	private JTextField textField;

	JFileChooser jFileChooser = new JFileChooser();
	private JLabel label_1;
	
	JLabel nlabel,commentlb,codelb;
	JTextArea comment,code;

	Discussion discussion;
	public DiscussionPanel(Discussion discussion) {
		
		
		setLayout(null);
		setSize(700,600);
		this.discussion=discussion;
		yorumlar=new ArrayList<Yorum>();

		yazi=new JLabel("Creator: "+discussion.sender);
        Font font = new Font("Courier", Font.BOLD,12);
        yazi.setForeground(Color.red);
		yazi.setBounds(0,0,250,50);
		yazi.setFont(font);
		add(yazi);
		textPane = new JTextPane();
		textPane.setBounds(10, 62, 233, 394);
		add(textPane);
		
		textField = new JTextField();
		textField.setBounds(6, 480, 130, 50);
		add(textField);
		textField.setColumns(10);
		
		commentlb=new JLabel("Comment");
		commentlb.setBounds(446, 45, 107, 16);
		comment=new JTextArea(discussion.comment);
		comment.setBounds(446,100,300,200);
		comment.setEditable(false);
		add(commentlb);
		add(comment);
		
		codelb=new JLabel("CODE");
		codelb.setBounds(446, 350, 107, 16);
		code=new JTextArea(discussion.code);
		code.setBounds(446,400,300,200);
		add(codelb);
		add(code);
		JButton btnNewButton = new JButton("Send");
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				java.util.Date dt = new java.util.Date();
				java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					
				appendToPane(textPane, textField.getText(), Color.black,false);
				appendToPane(textPane, sdf.format(dt), Color.yellow,true);

				
			}
		});
		btnNewButton.setBounds(148, 481, 102, 50);
		add(btnNewButton);
		
		
		
		
		label_1 = new JLabel("Messages");
		label_1.setBounds(46, 45, 107, 16);
		add(label_1);
		
		
		
		
		
		for(int a=0;a<yorumlar.size();a++)
		{
			Yorum y=yorumlar.get(a);
			appendToPane(textPane, y.ogrIsmi+": ", Color.red,false);
			appendToPane(textPane, y.yorum+" ", Color.black,false);
			appendToPane(textPane, y.date, Color.magenta,true);


		}

		thread=new Thread(this);
		thread.start();

	}
	 private void appendToPane(JTextPane tp, String msg, Color c,boolean yorum)
	    {
	        StyleContext sc = StyleContext.getDefaultStyleContext();
	        javax.swing.text.AttributeSet aset ;
	        	     aset   =  sc.addAttribute(SimpleAttributeSet.EMPTY, StyleConstants.Foreground, c);
	        
	        aset =  sc.addAttribute((javax.swing.text.AttributeSet) aset, StyleConstants.FontFamily, "Courier");
    		aset =  sc.addAttribute((javax.swing.text.AttributeSet) aset, StyleConstants.Alignment, StyleConstants.Bold);

	       if(yorum)
	       {
	    		aset=sc.addAttribute((javax.swing.text.AttributeSet) aset, StyleConstants.FontSize, 7);

	       }
	       else
	       {
	    		aset=sc.addAttribute((javax.swing.text.AttributeSet) aset, StyleConstants.Bold, true);
	       }
	      

	        

	        int len = tp.getDocument().getLength();
	        
	        tp.setCaretPosition(len);
	        tp.setCharacterAttributes((javax.swing.text.AttributeSet) aset, false);
	        
	        if(yorum)
	        tp.replaceSelection(msg+"\n");
	        else
		     tp.replaceSelection(msg);

	    }
	@Override
	public void run() {
		// TODO Auto-generated method stub
		
		
		while(true)
		{
			yaziX+=5;
			if(yaziX>500)
				yaziX=-120;
			
			yazi.setBounds(yaziX, 0, 250, 50);
			repaint();
			
			
			
			try {
				this.thread.sleep(150);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
	}
	public void paintComponent(Graphics g)
	{
		ImageIcon ic=new ImageIcon("bg.jpg");
		g.drawImage(ic.getImage(), 0, 0	,getWidth(),getHeight()	,this);
	}
}
