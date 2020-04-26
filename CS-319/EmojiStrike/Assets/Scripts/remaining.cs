using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class remaining : MonoBehaviour {

	UnityEngine.UI.Text score;
	public float remainingAmmo;

	GameObject player1;
	GameObject player2;	
	float timePassed;
	int oddOrEven;


	// Use this for initialization
	void Start () {
		
		timePassed = 30;
		oddOrEven = 0;

		player1 = GameObject.Find ("murderer");
		player2 = GameObject.Find ("murderer2");

		remainingAmmo = player1.GetComponent<destroyer2> ().ammo;

		score = GetComponent<UnityEngine.UI.Text>();

		score.text = "Ammo: " + remainingAmmo;
	}


	void Update () {



				if(timePassed > 0){
		timePassed -= Time.deltaTime;
		}
		else{
			timePassed=30;
			oddOrEven++;
		}
		if(oddOrEven%2==0 && player1 != null){
		remainingAmmo = player1.GetComponent<destroyer2> ().ammo;
		}
		else if ( player2 != null)
			remainingAmmo = player2.GetComponent<destroyer1> ().ammo;
		score.text = "Ammo: " + remainingAmmo;
	}
}
