using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class KeyPressMap : MonoBehaviour {

	// Use this for initialization
	void Start () {
		
	}

	// Update is called once per frame
	void Update () {
		if (Input.GetKeyDown(KeyCode.R)) {
			Application.LoadLevel("HomePage");
		}
		else if (Input.GetKeyDown(KeyCode.Return)) {
			Application.LoadLevel("Player Setup");
		}
	}
}
