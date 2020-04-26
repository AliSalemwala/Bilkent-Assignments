using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Disabling1 : MonoBehaviour {

	float timePassed;
	int oddOrEven;
	
	// Use this for initialization
	void Start () {
		timePassed = 30;
		oddOrEven = 0;

	}
	
	// Update is called once per frame
	void Update () {
		if(timePassed > 0){
		timePassed -= Time.deltaTime;
		}
		else{
			timePassed=30;
			oddOrEven++;
		}
		if(oddOrEven%2==0){
			GetComponent<destroyer1>().enabled = false;
			GetComponent<mover2>().enabled = false;
		}
		else{
			GetComponent<destroyer1>().enabled = true;
			GetComponent<mover2>().enabled = true;
		}
	}
}

