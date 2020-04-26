using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class SwitchEmoji : MonoBehaviour {
	string curEmoji1;
	string curEmoji2;
	int state;

	// Use this for initialization
	void Start () {
		curEmoji1 = "emo1";
		curEmoji2 = "emo1";
		state = 1;
	}

	// Update is called once per frame
	void Update () {
		if (Input.GetKeyDown ("Return") && state == 4) {
			Debug.Log("Return pressed");
			Application.LoadLevel ("Emoji1");
		} 
		else if (Input.GetKeyDown ("Return") && state != 4) {
			state += 1;
		}
		// check ıf asoace wırjug un keybıard ınput states
		else if (Input.GetKeyDown ("left")) 
		{
			if (state == 2) {
				if (curEmoji1 == "emo1")
					curEmoji1 = "emo3";
				else if (curEmoji1 == "emo3")
					curEmoji1 = "emo2";
				else if (curEmoji1 == "emo2")
					curEmoji1 = "emo1";
				this.gameObject.GetComponent<Image> ().sprite = (Sprite)Resources.Load (curEmoji1, typeof(Sprite));
			}
			else if (state == 4) {
				if (curEmoji2 == "emo1")
					curEmoji2 = "emo3";
				else if (curEmoji2 == "emo3")
					curEmoji2 = "emo2";
				else if (curEmoji2 == "emo2")
					curEmoji2 = "emo1";
				this.gameObject.GetComponent<Image> ().sprite = (Sprite)Resources.Load (curEmoji2, typeof(Sprite));
			}
		}
		else if (Input.GetKeyDown("right"))
		{
			if (state == 2) {
				if (curEmoji1 == "emo1")
					curEmoji1 = "emo2";
				else if (curEmoji1 == "emo2")
					curEmoji1 = "emo3";
				else if (curEmoji1 == "emo3")
					curEmoji1 = "emo1";
				this.gameObject.GetComponent<Image> ().sprite = (Sprite)Resources.Load (curEmoji1, typeof(Sprite));
			}
			else if (state == 4) {
				if (curEmoji2 == "emo1")
					curEmoji2 = "emo2";
				else if (curEmoji2 == "emo2")
					curEmoji2 = "emo3";
				else if (curEmoji2 == "emo3")
					curEmoji2 = "emo1";
				this.gameObject.GetComponent<Image> ().sprite = (Sprite)Resources.Load (curEmoji2, typeof(Sprite));
			}
		}
	}


}