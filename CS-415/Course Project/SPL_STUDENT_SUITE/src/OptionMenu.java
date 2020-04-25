import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class OptionMenu extends JPanel implements ActionListener {
    Font font = new Font("Courier", Font.PLAIN,12);

	public static int width=300,height=70;
	JButton button1,button2,button3,button4,button5;
	MainPanel mainPanel;
	int x, y;
	JFrame frame;
	public OptionMenu(JFrame frame,MainPanel p,int x,int y)
	{
		this.frame=frame;
		this.x=x;
		this.y=y;
		setLayout(new GridLayout(2, 1));
		setBounds(0,0,width,height);
		mainPanel=p;
		
		button1=new JButton("add/remove  breakpoint");
		button2=new JButton("Show API");
		button3=new JButton("Insert conditional breakpoint");
		button4=new JButton("Make automatic test");
		button5=new JButton("make script test");
		button1.addActionListener(this);
		button2.addActionListener(this);
		button1.setFont(font);
		button2.setFont(font);
		add(button1);
		add(button2);
		
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		if(e.getSource()==button1) {
			
			mainPanel.addBreakPoint(x,y);
			frame.setVisible(false);
		}
		
	}
}
