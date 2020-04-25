import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

public class OptionMenu2 extends JPanel implements ActionListener {
    Font font = new Font("Courier", Font.PLAIN,12);

	public static int width=300,height=70;
	JButton button1,button2,button3,button4,button5;
	MainPanel mainPanel;
	int x, y;
	JFrame frame;
	String path;
	public OptionMenu2(JFrame frame,MainPanel p,int x,int y, String selectedPath)
	{
		System.out.println("path:"+selectedPath);
		this.path=selectedPath;
		this.frame=frame;
		this.x=x;
		this.y=y;
		setLayout(new GridLayout(3, 1));
		setBounds(0,0,width,height);
		mainPanel=p;
		
		button1=new JButton("Create new file ");
		button2=new JButton("delete file");
		button3=new JButton("rename file ");
		button1.addActionListener(this);
		button2.addActionListener(this);
		button3.addActionListener(this);
		button1.setFont(font);
		button2.setFont(font);
		button3.setFont(font);
		add(button1);
		
		add(button2);
		add(button3);
		
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		if(e.getSource()==button1) {
			
			String a=JOptionPane.showInputDialog("Please enter  name.");
			String pat=path.substring(0,path.lastIndexOf(File.separator))+File.separator+a;
			System.out.println("out:"+pat);
			File file=new File(pat);
			try {
				file.createNewFile();
			} catch (IOException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
			
			mainPanel.recreatetree();
			frame.setVisible(false);
		}
		if(e.getSource()==button2)
		{
			File file=new File(path);
			file.delete();
			mainPanel.recreatetree();
			
		}
		if(e.getSource()==button3)
		{
			String a=JOptionPane.showInputDialog("Please enter new name.");
			File old=new File(path);
			Path source = Paths.get(path);
			try {
				Files.move(source, source.resolveSibling(a));
			} catch (IOException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}

		mainPanel.recreatetree();
		}
		
	}
}
