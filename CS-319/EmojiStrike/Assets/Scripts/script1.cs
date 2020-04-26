using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class script1 : MonoBehaviour {

	public GameObject murderer;
	private Vector3 offset;

	// Use this for initialization
	void Start () {
		offset = transform.position - murderer.transform.position;
	}
	
	// Update is called once per frame
	void LateUpdate () {
		transform.position = murderer.transform.position + offset;
	}
}
