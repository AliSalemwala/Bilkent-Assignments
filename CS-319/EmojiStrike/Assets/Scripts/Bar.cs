using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Destructible2D;
public class Bar : MonoBehaviour {

	public GameObject player;

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {

		float damage = player.GetComponent<D2dDestructible> ().damage;

		float myHealth = 1 - damage / 5000;

		transform.localScale = new Vector3( myHealth , transform.localScale.y ,transform.localScale.z);
		
	}
}
