using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Destructible2D;

public class TextureChanger : MonoBehaviour {

	public Texture tex0;
	public Texture tex1;
	public Texture tex2;
	public Texture tex3;
	public Texture tex4;
	public Texture tex5;
	public Texture tex6;
	public Texture tex7;
	public Texture tex8;
	public Texture tex9;

//texture lar public oldu�u i�in direk atayabiliyosun ama private 
//olsun istersen metod yazabilirim

//texture say�s� artabilir

	private int choice1= 0; 
	private int choice2= 0;

//choice1 murderer i�in choice2 murderer2 i�in

//Choice'lar� setChoiceOne(int) ve setChoiceTwo(int) metodlar�yla
//de�i�tirirsen (herhangi bir zamanda) texturelar de�i�ir
//iki metod da de�erleri kontroll� al�yor(0la 9 aras�nda 0 ve 9
//dahil

//choice1 e de choice2'ye de �nde�er(int) vermene gerek yok
//e�er �nde�er vermezsen Start() � silmeni �neririm ve
//objenin(murderer vs) i�indeki D2dDestructible daki texture'a
//bi �nde�er(Texture) vermeni �neririm

	void Start(){

		choice1 = PlayerPrefs.GetInt("p1emo");
		choice2 = PlayerPrefs.GetInt("p2emo");

		Change();
	}
	void Change() {
		if(choice1 == 0)
			GameObject.Find("murderer").GetComponent<D2dDestructible>().MainTex = tex0;
		if(choice2 == 0)
			GameObject.Find("murderer2").GetComponent<D2dDestructible>().MainTex = tex0;

		if(choice1 == 1)
			GameObject.Find("murderer").GetComponent<D2dDestructible>().MainTex = tex1;
		if(choice2 == 1)
			GameObject.Find("murderer2").GetComponent<D2dDestructible>().MainTex = tex1;

		if(choice1 == 2)
			GameObject.Find("murderer").GetComponent<D2dDestructible>().MainTex = tex2;
		if(choice2 == 2)
			GameObject.Find("murderer2").GetComponent<D2dDestructible>().MainTex = tex2;

		if(choice1 == 3)
			GameObject.Find("murderer").GetComponent<D2dDestructible>().MainTex = tex3;
		if(choice2 == 3)
			GameObject.Find("murderer2").GetComponent<D2dDestructible>().MainTex = tex3;

		if(choice1 == 4)
			GameObject.Find("murderer").GetComponent<D2dDestructible>().MainTex = tex4;
		if(choice2 == 4)
			GameObject.Find("murderer2").GetComponent<D2dDestructible>().MainTex = tex4;

		if(choice1 == 5)
			GameObject.Find("murderer").GetComponent<D2dDestructible>().MainTex = tex5;
		if(choice2 == 5)
			GameObject.Find("murderer2").GetComponent<D2dDestructible>().MainTex = tex5;

		if(choice1 == 6)
			GameObject.Find("murderer").GetComponent<D2dDestructible>().MainTex = tex6;
		if(choice2 == 6)
			GameObject.Find("murderer2").GetComponent<D2dDestructible>().MainTex = tex6;

		if(choice1 == 7)
			GameObject.Find("murderer").GetComponent<D2dDestructible>().MainTex = tex7;
		if(choice2 == 7)
			GameObject.Find("murderer2").GetComponent<D2dDestructible>().MainTex = tex7;	

		if(choice1 == 8)
			GameObject.Find("murderer").GetComponent<D2dDestructible>().MainTex = tex8;
		if(choice2 == 8)
			GameObject.Find("murderer2").GetComponent<D2dDestructible>().MainTex = tex8;	
			
		if(choice1 == 9)
			GameObject.Find("murderer").GetComponent<D2dDestructible>().MainTex = tex9;
		if(choice2 == 9)
			GameObject.Find("murderer2").GetComponent<D2dDestructible>().MainTex = tex9;					

	}
	public bool setChoiceOne(int num){
		if(num>=0&&num<=9){
			choice1 = num;
			Change();
			return true;
		}
		else return false;
	}
	public bool setChoiceTwo(int num){
		if(num>=0&&num<=9){
			choice2 = num;
			Change();
			return true;
		}
		else return false;

	}
	
	// Update is called once per frame
}
