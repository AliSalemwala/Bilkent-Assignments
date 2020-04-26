using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class package : MonoBehaviour {

	private int type;
	// Use this for initialization
	void Start () {	
		type = Random.Range (0, 2);
	}
	
	// Update is called once per frame
	void Update () {
		
	}


	public int getType() {
		return type;
	}
}
