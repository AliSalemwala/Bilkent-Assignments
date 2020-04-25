import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.event.MenuEvent;
import javax.swing.event.MenuListener;


public class MainFrame extends JFrame implements MenuListener,ActionListener {
	
	public static int width=1000,height=700;
	JMenuBar menuBar;
	JMenu file, edit,versionControl,themes,encoding,api,debugger;
	JMenuItem open,save,dark,daylight,apiSupp,apiview;

	MainPanel m;
	public MainFrame() {
		setSize(width,height);
		
		m=new MainPanel();
		menuBar = new JMenuBar();
		file=new JMenu("File");
		edit=new JMenu("Edit");
		encoding=new JMenu("Encoding");
		themes=new JMenu("Theme");
		open=new JMenuItem("Open");
		save=new JMenuItem("save");
		apiSupp=new JMenuItem("Api support");
		apiview=new JMenuItem("Api viever");
		dark=new JMenuItem("dark");
		daylight=new JMenuItem("daylight");
		
		open.addActionListener(this);
		
		file.add(open);
		file.add(save);
		themes.add(dark);
		themes.add(daylight);
		menuBar.add(file);
		menuBar.add(edit);
		menuBar.add(themes);
		menuBar.add(encoding);
		debugger=new JMenu("Debugger");
		api=new JMenu("API");
		api.add(apiSupp);
		api.add(apiview);
		menuBar.add(api);
		menuBar.add(debugger);
		setJMenuBar(menuBar);
		
		setContentPane(m);
	}



	@Override
	public void menuSelected(MenuEvent e) {
		// TODO Auto-generated method stub
		
		
	}

	@Override
	public void menuDeselected(MenuEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void menuCanceled(MenuEvent e) {
		// TODO Auto-generated method stub
		
	}



	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		m.createFileTree();
		revalidate();
		repaint();

	}

}
