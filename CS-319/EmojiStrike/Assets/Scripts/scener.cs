using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement; 

public class scener : MonoBehaviour {

	static scener Instance;

	// Use this for initialization
	void Start () {

		PlayerPrefs.SetString("Player1", "P1");
		PlayerPrefs.SetString("Player2", "P2");
		PlayerPrefs.Save();
		SceneManager.LoadScene("HomePage");

		// if ( Instance != null){

		// 	GameObject.Destroy(gameObject);

		// }
		// else{

		// 	GameObject.DontDestroyOnLoad(gameObject);
		// 	Instance = this;
		// }
	}
	
	// Update is called once per frame
	void Update () {

	}

}
