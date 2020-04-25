import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;

public class ProjectManagementPanel extends JPanel implements ActionListener {

	DefaultListModel<String> listModel,listModel2;
	JList<String> peoples,tasks;
	JButton addPeople,addTask;

	public ProjectManagementPanel()
	{
		setLayout(null);
		 listModel = new DefaultListModel<>();
		 listModel2 = new DefaultListModel<>();
		 
		 addPeople=new JButton("ADD People");
		 addPeople.setBounds(0, 0, 90,50 );
		 addPeople.addActionListener(this);
		 addTask=new JButton("ADD TASK");
		 addTask.setBounds(92, 0, 90,50 );
		 addTask.addActionListener(this);
		 
		 peoples=new JList<>(listModel);
		 tasks=new JList<>(listModel2);
		 
		 JScrollPane sp=new JScrollPane(peoples);
		 JScrollPane sp2=new JScrollPane(tasks);
		 
		 sp.setBounds(0, 100,200, 200);
		 sp2.setColumnHeaderView(new JLabel("       Tasks"));
		 sp2.setBounds(0, 300,200, 200);
		 sp.setColumnHeaderView(new JLabel("       PEOPLE"));
		 add(addTask);
		 add(sp);
		 add(addPeople);
		 add(sp2);
		 

		
		
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		
		if(e.getSource()==addPeople)
		{
			String name=JOptionPane.showInputDialog("Please enter name..");
			listModel.addElement(name);
			repaint();
		}
		if(e.getSource()==addTask)
		{
			if(peoples.isSelectionEmpty())
			{
				return;
			}
			String task=JOptionPane.showInputDialog("Please enter task for "+peoples.getSelectedValue());
			listModel2.addElement(peoples.getSelectedValue()+"      =>    "+task);
			repaint();
		}
	}
}
