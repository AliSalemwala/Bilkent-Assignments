using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;


public class namemaker : MonoBehaviour {
	
	UnityEngine.UI.Text nameT;
	string name;
	float timePassed;
	int oddOrEven;
	// Use this for initialization
	void Start () {
		timePassed = 30;
		oddOrEven = 0;
		nameT = GetComponent<UnityEngine.UI.Text>();
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
			name = PlayerPrefs.GetString ("p1");

		}
		else{
			name = PlayerPrefs.GetString ("p2");

		}
		nameT.text = name;
		
	}
}
