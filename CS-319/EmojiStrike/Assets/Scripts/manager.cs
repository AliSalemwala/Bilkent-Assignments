using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class manager : MonoBehaviour {

	public int weaponSelection;
	public int activePlayers;
	private GameObject indic;
	private float powerCool = 0f;
	public GameObject powerup;
	public Image img;


	// Use this for initialization
	void Start () {
		activePlayers = 2;
		weaponSelection = 0;
		indic = GameObject.Find ("indicator");
	}
	
	// Update is called once per frame
	void Update () {

		powerCool -= Time.deltaTime;
		if (powerCool < 0f) {
			Instantiate (powerup, new Vector3 (Random.Range (-20.0f, 20.0f), 10, 0), Quaternion.Euler (new Vector3 (0, 0, 0)));  
			powerCool = 10f;
		}


		if (activePlayers == 1) {
			img.enabled = true;
		}

		//scroll weapons
		if (Input.GetKeyDown (KeyCode.W)) {
			weaponSelection = (weaponSelection + 1) % 3;



			if (weaponSelection == 1) {
				
				indic.transform.position = new Vector3 ((indic.transform.position.x + 3.5f), indic.transform.position.y, 0);

			}
			else if (weaponSelection == 2) {

				indic.transform.position = new Vector3 ((indic.transform.position.x + 3.3f), indic.transform.position.y, 0);
			}

			else if (weaponSelection == 0 ) {

				indic.transform.position = new Vector3 ((indic.transform.position.x - 6.8f), indic.transform.position.y, 0);

			}

		}


	}
}
