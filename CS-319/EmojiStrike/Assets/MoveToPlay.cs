using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class MoveToPlay : MonoBehaviour {

	// Use this for initialization
	void Start () {
		Debug.Log ("Hi we made it");
	}
	
	// Update is called once per frame
	void Update () {
		Debug.Log ("Free");
	}

	void OnMouseDown(){
		Debug.Log("Sprite Clicked");
		change();
	}

	void change(){
		Sprite b = Resources.Load("b.jpg") as Sprite;

		gameObject.GetComponent<SpriteRenderer> ().sprite = (Sprite)Resources.Load ("b", typeof(Sprite));
	}		
}