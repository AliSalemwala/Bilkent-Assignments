using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class curEmoC : MonoBehaviour {

	int curEmo;
	Sprite img;
	// Use this for initialization
	void Start () {
		curEmo = 0;
	}
	
	// Update is called once per frame
	void Update () {
		if (Input.GetKeyDown (KeyCode.A)) 
		{
			Debug.Log("Pressed");
			if (curEmo == 0)
				curEmo = 3;
			else if (curEmo == 1)
				curEmo = 0;
			else if (curEmo == 2)
				curEmo = 1;
			else if (curEmo == 3)
				curEmo = 2;
		}
		if (Input.GetKeyDown (KeyCode.S)) 
		{
			if (curEmo == 0)
				curEmo = 1;
			else if (curEmo == 1)
				curEmo = 2;
			else if (curEmo == 2)
				curEmo = 3;
			else if (curEmo == 3)
				curEmo = 0;
		}


		if (curEmo == 0)
			img = (Sprite)Resources.Load ("cowboy", typeof(Sprite));
		else if (curEmo == 1)
			img = (Sprite)Resources.Load ("murderer", typeof(Sprite));
		else if (curEmo == 2)
			img = (Sprite)Resources.Load ("cool", typeof(Sprite));
		else if (curEmo == 3)
			img = (Sprite)Resources.Load ("hearts", typeof(Sprite));

		gameObject.GetComponent<Image> ().sprite = img;
	}
}
