using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class camerasc : MonoBehaviour {


	public GameObject murderer;
	public GameObject enemy;
	private Vector3 offset;
	private Vector3 offset1;
	private int caseNum=0;

	// Use this for initialization
	void Start () {
		offset = transform.position - murderer.transform.position;
		offset1 = transform.position - enemy.transform.position;
	}

	// Update is called once per frame
	void LateUpdate () {


		if(Input.GetKeyDown(KeyCode.Z))
			caseNum = 1;
		if(Input.GetKeyDown (KeyCode.X))
			caseNum = 2;

		if (caseNum==1) {
			transform.position = murderer.transform.position + offset;
		}
		else if(caseNum==2){
			transform.position = enemy.transform.position + offset1;
		}
	}
}