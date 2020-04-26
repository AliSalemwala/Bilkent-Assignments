using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class KeyListener : MonoBehaviour {
	string curMap;

	// Use this for initialization
	void Start () {
		curMap = "m1";
		this.gameObject.GetComponent<Image> ().sprite = (Sprite)Resources.Load (curMap, typeof(Sprite));
	}
	
	// Update is called once per frame
	void Update () {
		if (Input.GetKeyDown ("left")) {
			if (curMap == "m1")
				curMap = "m2";
			else if (curMap == "m2")
				curMap = "m1";

			this.gameObject.GetComponent<Image> ().sprite = (Sprite)Resources.Load (curMap, typeof(Sprite));

			PlayerPrefs.SetString("MapSelect", curMap);

		}
		else if (Input.GetKeyDown("right")){
			if (curMap == "m1")
				curMap = "m2";
			else if (curMap == "m2")
				curMap = "m1";

			this.gameObject.GetComponent<Image> ().sprite = (Sprite)Resources.Load (curMap, typeof(Sprite));
		}

		PlayerPrefs.SetString("MapSelect", curMap);
		PlayerPrefs.Save();
	}
}