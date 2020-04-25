import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;

import javax.swing.JLabel;
import javax.swing.JPanel;

public class OutputPanel extends JPanel {
    Font font = new Font("Courier", Font.BOLD,12);
    JLabel label;
	public OutputPanel()
	{
		
		label=new JLabel("OUTPUT WINDOW");
		label.setFont(font);
		setBackground(Color.LIGHT_GRAY);
		setBounds(200,MainFrame.height*3/4,MainFrame.width-200,MainFrame.height/4);
		label.setBounds(0,0,80,50);
		add(label);
	}
	
	public void paintComponent(Graphics g)
	{
		super.paintComponent(g);
		g.setFont(font);
		g.drawRect(0, 0, getWidth(), getHeight());
		g.drawString("OUTPUT",200,200);

	}

}
