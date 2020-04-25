import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;

public class MainFrame extends JFrame {
	
	public static int width=1000,height=700;
	JMenuBar menuBar;
	JMenu file, edit,versionControl,themes,encoding;
	JMenuItem open,save,dark,daylight;

	public MainFrame() {
		super("Basic Version");
		setSize(width,height);
		
		menuBar = new JMenuBar();
		file=new JMenu("File");
		edit=new JMenu("Edit");
		encoding=new JMenu("Encoding");
		themes=new JMenu("Theme");
		open=new JMenuItem("Open");
		save=new JMenuItem("save");
		dark=new JMenuItem("dark");
		daylight=new JMenuItem("daylight");
		
		file.add(open);
		file.add(save);
		themes.add(dark);
		themes.add(daylight);
		menuBar.add(file);
		menuBar.add(edit);
		menuBar.add(themes);
		menuBar.add(encoding);
		
		setJMenuBar(menuBar);
	}

}
