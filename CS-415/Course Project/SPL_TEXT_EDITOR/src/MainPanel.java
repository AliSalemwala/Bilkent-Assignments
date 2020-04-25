import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.io.File;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTabbedPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.JTextPane;
import javax.swing.text.BadLocationException;
import javax.swing.text.DefaultHighlighter;
import javax.swing.text.DefaultHighlighter.DefaultHighlightPainter;
import javax.swing.text.Document;
import javax.swing.text.Highlighter;
import javax.swing.text.JTextComponent;
import javax.swing.text.Highlighter.HighlightPainter;

public class MainPanel extends JPanel implements KeyListener,ActionListener{
	
    final DefaultHighlightPainter painter = new DefaultHighlightPainter(Color.pink);

	JTabbedPane tabbedPane ;
    Font font = new Font("Courier", Font.PLAIN,12);

    char last='1';
    int lasthighlight=0;
    JTextArea txtarea;
	public MainPanel()
	{
		setLayout(null);
		setBounds(0,0,MainFrame.width,MainFrame.height);
		
		 txtarea = new JTextArea();

		JScrollPane pane=new JScrollPane(txtarea);
		pane.setBounds(0,0,getWidth(),getHeight());
		txtarea.setBounds(0,0,getWidth(),getHeight());
		txtarea.setText("");
		txtarea.setFont(font);
		txtarea.addKeyListener(this);
		pane.add(txtarea);
		add(pane);
		
	}

	@Override
	public void keyTyped(KeyEvent e) {
		// TODO Auto-generated method stub
		
		highlight(txtarea);

		if(e.getKeyChar()==' ')
		{
		}
		if(last=='f'&&e.getKeyChar()=='f')
		{
			String word=JOptionPane.showInputDialog("Enter word");
			String text=txtarea.getText();
			int begin=text.indexOf(word);
			if(begin>0)
			{
				txtarea.setSelectionStart(begin);
				txtarea.setSelectionEnd(word.length());
				txtarea.requestFocus();
				repaint();
				txtarea.repaint();
				
			}
			
		}
		last=e.getKeyChar();
		
	}
	public void highlight(JTextArea textarea)
	{
	    String text = textarea.getText();
	    Highlighter highlighter = textarea.getHighlighter();
	    highlighter.removeAllHighlights();
        highlight(txtarea, "if", painter);
        highlight(txtarea, "else", painter);
        highlight(txtarea, "for", painter);
        highlight(txtarea, "while", painter);
        highlight(txtarea, "public", painter);
        highlight(txtarea, "static", painter);
        highlight(txtarea, "void", painter);
        highlight(txtarea, "private", painter);
        highlight(txtarea, "int", painter);
        highlight(txtarea, "double", painter);
        highlight(txtarea, "char", painter);

		
	}
	 public  void highlight(JTextArea textarea, String textToHighlight,
		      HighlightPainter painter) {
		 
		  String text = textarea.getText();
		    Highlighter highlighter = textarea.getHighlighter();

		    if (!textToHighlight.isEmpty()) {
		      Matcher m = compileWildcard(textToHighlight).matcher(text);
		      while (m.find()) {
		        try {
		          highlighter.addHighlight(m.start(), m.end(), painter);
		        } catch (BadLocationException e) {
		          throw new IllegalStateException(e); /* cannot happen */
		        }
		        //textarea.setCaretPosition(m.end());
		      }
		    }
		  }

	 public  Pattern compileWildcard(String wildcard) {
		    StringBuilder sb = new StringBuilder("\\b"); /* word boundary */
		    /* the following replaceAll is just for performance */
		    for (char c : wildcard.replaceAll("\\*+", "*").toCharArray()) {
		      if (c == '*') {
		        sb.append("\\S*"); /*- arbitrary non-space characters */
		      } else {
		        sb.append(Pattern.quote(String.valueOf(c)));
		      }
		    }
		    sb.append("\\b"); /* word boundary */
		    return Pattern.compile(sb.toString());
		  }
	@Override
	public void keyPressed(KeyEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void keyReleased(KeyEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		
	}

}
