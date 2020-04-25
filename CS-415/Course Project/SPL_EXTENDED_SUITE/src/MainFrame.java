import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.event.MenuEvent;
import javax.swing.event.MenuListener;

import Forums.ForumsPanel;

public class MainFrame extends JFrame implements MenuListener,ActionListener {
	
	public static int width=1000,height=700;
	JMenuBar menuBar;
	JMenu file, edit,versionControl,themes,encoding,forum,api,debugger,vca,pm;
	JMenuItem open,save,dark,daylight,apiSupp,apiview,git,svn;
	MainPanel m;
	public MainFrame() {
		setSize(width,height);
		
		m=new MainPanel();
		menuBar = new JMenuBar();
		file=new JMenu("File");
		vca=new JMenu("VCA");
		pm=new JMenu("PM");
		edit=new JMenu("Edit");
		encoding=new JMenu("Encoding");
		themes=new JMenu("Theme");
		open=new JMenuItem("Open");
		save=new JMenuItem("save");
		apiSupp=new JMenuItem("Api support");
		git=new JMenuItem("SVN");
		svn=new JMenuItem("GIT");
		apiview=new JMenuItem("Api viever");
		dark=new JMenuItem("dark");
		daylight=new JMenuItem("daylight");
		forum=new JMenu("Forum");
		forum.addMenuListener(this);

		api=new JMenu("API");

		open.addActionListener(this);

		file.add(open);
		file.add(save);
		themes.add(dark);
		themes.add(daylight);
		menuBar.add(file);
		menuBar.add(edit);
		menuBar.add(themes);
		menuBar.add(encoding);
		vca.add(git);
		vca.add(svn);
		debugger=new JMenu("Debugger");
		api=new JMenu("API");
		api.add(apiSupp);
		api.add(apiview);
		menuBar.add(api);
		menuBar.add(debugger);
		menuBar.add(forum);
		menuBar.add(vca);
		menuBar.add(pm);
		
		setContentPane(m);
		setJMenuBar(menuBar);
	}

	@Override
	public void menuSelected(MenuEvent e) {
		// TODO Auto-generated method stub
		if(e.getSource()==forum)
		{
			JFrame frame=new JFrame("Forums");
			frame.add(new ForumsPanel());
			frame.setSize(800, 800);
			frame.setVisible(true);
		}
		
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		m.createFileTree();
		revalidate();
		repaint();

	}
	@Override
	public void menuDeselected(MenuEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void menuCanceled(MenuEvent e) {
		// TODO Auto-generated method stub
		
	}

}
