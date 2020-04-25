package Model;

import java.awt.Image;

import javax.swing.ImageIcon;

public class Slot {
	
	public Card card;
	public Image image;
	public Image unavaibleImage;
	
	public boolean isDeck;
	
	
	public boolean avaible;
	public Slot(Card card)
	{
		isDeck=false;
		this.card=card;
		avaible=true;
		unavaibleImage=new ImageIcon("img/unavaibleSlot.png").getImage();
	}
	public Slot(String im)
	{
		isDeck=false;
		card=new Card();
		image=new ImageIcon("img/nocard.png").getImage();
		unavaibleImage=new ImageIcon("img/unavaibleSlot.png").getImage();

		card.image=image;
		avaible=true;
	}
	
	public void setAvaible(boolean av)
	{
		this.avaible=av;
	}
	
	public  void setType(String typ)
	{
		
		card.type=typ;
	}
	

}
