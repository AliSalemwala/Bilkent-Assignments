package Forums;

import java.util.ArrayList;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTabbedPane;


import java.awt.event.ActionListener;
import java.awt.Graphics;
import java.awt.event.ActionEvent;

public class ForumsPanel extends JPanel implements ActionListener
{

	/**
	 * Create the panel.
	 */
	public JTabbedPane pane;
	JButton back,create;
	public ArrayList<Discussion> discussions;

	public ForumsPanel() {
		setBounds(0, 0, 800, 800);
		setLayout(null);
		pane=new JTabbedPane();
		pane.setBounds(0,0,769,713);
		back=new JButton("Geri");
		create=new JButton("Create room");
	
		discussions=new ArrayList<>();
		back.setBounds(0,getHeight()-75,60,50);
		create.setBounds(400,getHeight()-75,60,50);
		create.addActionListener(this);
		
		
		for(int a=0;a<discussions.size();a++)
			pane.addTab(discussions.get(a).sender, new DiscussionPanel(discussions.get(a)));
		
		
		
		add(create);
		add(back);
		add(pane);
	}
	public void paintComponent(Graphics g)
	{
		ImageIcon ic=new ImageIcon("bg.jpg");
		g.drawImage(ic.getImage(), 0, 0	,getWidth(),getHeight()	,this);
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		if(e.getSource()==create)
		{
			JFrame frame=new JFrame("Create room");
			frame.setSize(400, 600);
			frame.add(new CreateRoomPanel(frame,this));
			frame.setVisible(true);
		}
		
	}
}
