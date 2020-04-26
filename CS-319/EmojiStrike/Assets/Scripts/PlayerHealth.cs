using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerHealth : MonoBehaviour {


	public float MAX_HEALTH = 500f;
	public float currentHealth = 0f;

	// Use this for initialization
	void Start () {
		currentHealth = MAX_HEALTH;
		InvokeRepeating ( "decreaseHealth", 1f, 1f);
	}
	
	// Update is called once per frame
	void Update () {



		
	}

	void decreaseHealth() {

		currentHealth -= 2f;
	}

}
