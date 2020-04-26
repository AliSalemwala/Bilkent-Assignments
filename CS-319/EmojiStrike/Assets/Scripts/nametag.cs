using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class nametag : MonoBehaviour {

	UnityEngine.UI.Text name;

	// Use this for initialization
	void Start () {
		name = GetComponent<UnityEngine.UI.Text>();
		name.text = PlayerPrefs.GetString("Player1");

	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
