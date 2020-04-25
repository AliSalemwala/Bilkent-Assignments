package Forums;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextArea;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class CreateRoomPanel extends JPanel implements ActionListener {
	
	JTextField name;
	JLabel nlabel,commentlb,codelb;
	JTextArea comment,code;
	JFrame frame;
	JButton create;
	ForumsPanel fp;
	public CreateRoomPanel(JFrame frame,ForumsPanel fp)
	{
		this.fp=fp;
		setLayout(null);
		setSize(400,600);
		this.frame=frame;
		nlabel=new JLabel("Name:");
		nlabel.setBounds(0,0,100,50);
		name=new JTextField();
		name.setBounds(200,0,100,50);
		create=new JButton("CREATE");
		create.setBounds(0, 60, 60, 50);
		commentlb=new JLabel("COMMENT");
		commentlb.setBounds(250,60,80,50);
		comment=new JTextArea();
		comment.setBounds(0,120,getWidth(),200);
		codelb=new JLabel("CODE");
		codelb.setBounds(250, 330, 80, 50);
		code=new JTextArea();
		code.setBounds(0,380,getWidth(),200);
		
		create.addActionListener(this);
		add(name);
		add(nlabel);
		add(comment);
		add(commentlb);
		add(code);
		add(codelb);
		add(create);
		
		
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		if(e.getSource()==create)
		{
			Discussion d=new Discussion(name.getText(), code.getText(), comment.getText());
			fp.discussions.add(d);
			fp.	pane.addTab(d.sender, new DiscussionPanel(d));
			fp.repaint();

			frame.setVisible(false);
		}
		
	}

}
