using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class NextMap : MonoBehaviour {

	// Use this for initialization
	void Start () {
	}
	
	// Update is called once per frame
	void Update () {
		
	}

	void OnMouseDown(){
		foreach (Transform child in transform.parent) {
			if (child.name == "Map") {
				Debug.Log ("Found sibling " + child.name);
				child.gameObject.GetComponent<Image> ().sprite = (Sprite)Resources.Load ("m3", typeof(Sprite));
				// work with child here
			}
		}
	}
}
