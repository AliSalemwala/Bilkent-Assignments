using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Disabling : MonoBehaviour {

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
			GetComponent<destroyer2>().enabled = true;
			GetComponent<mover>().enabled = true;
		}
		else{
			GetComponent<destroyer2>().enabled = false;
			GetComponent<mover>().enabled = false;
		}
	}
}
