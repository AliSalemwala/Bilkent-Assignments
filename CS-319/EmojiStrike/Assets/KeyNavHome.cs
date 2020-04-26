using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class KeyNavHome : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		if (Input.GetKeyDown(KeyCode.T)) {
			Application.LoadLevel("Tutorial");
		}
		else if (Input.GetKeyDown(KeyCode.P)) {
			Application.LoadLevel("MapSelect");
		}
	}
}
