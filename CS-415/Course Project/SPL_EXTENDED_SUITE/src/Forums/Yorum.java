package Forums;

import java.sql.Date;

public class Yorum {

	public int yorumNo;
	public int sinif_no;
	public int ogrenci_no;
	public String yorum;
	public String date;
	public String ogrIsmi;
	
	public  Yorum(int y,int s,int o,String yorum, String d,String ogrenci)
	{
		this.yorum=yorum;
		this.yorumNo=y;
		this.sinif_no=s;
		this.ogrIsmi=ogrenci;
		this.ogrenci_no=o;
		this.date=d;
		
	}
	
}
