using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Damage : MonoBehaviour {
	private int health;
	// Use this for initialization

	void Start () {
		health = 100;
	}

	public int getHealth(){
		return health;
	}

	public void decreaseHealth(int amount){
		health = health - amount;
	}
}
