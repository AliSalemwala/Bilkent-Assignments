using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class writer : MonoBehaviour {

	UnityEngine.UI.Text score;
	float timePassed;
	int oddOrEven;
	
	// Use this for initialization
	void Start () {
		timePassed = 30;
		oddOrEven = 0;

		score = GetComponent<UnityEngine.UI.Text>();
	}
	
	// Update is called once per frame
	void Update () {
		if(timePassed > 0){
		timePassed -= Time.deltaTime;
		score.text = "Remaining time: " + ((int)timePassed) % 30;
		}
		else{
			timePassed=30;
			oddOrEven++;
		}
	}
}
