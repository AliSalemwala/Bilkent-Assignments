using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement; 

public class InputSave : MonoBehaviour {

	InputField p1;
	InputField p2;
	ScriptableObject details;

	// Use this for initialization
	void Start () {
		//details = transform.Find ("DataTrans").GetComponent<Data>;
		p1 = transform.Find ("p1Name").GetComponent<InputField>();
		p2 = transform.Find ("p2Name").GetComponent<InputField>();
	}
	
	// Update is called once per frame
	void Update () {
		string p1N = p1.text;
		string p2N = p2.text;
		
		if ( Input.GetKeyDown(KeyCode.Return)) {

			if ( PlayerPrefs.GetString("MapSelect") == "m1" ){
				SceneManager.LoadScene("emoji1");
			}
			if ( PlayerPrefs.GetString("MapSelect") == "m2" ){
				SceneManager.LoadScene("emoji2");
			}

			PlayerPrefs.SetString("p1", p1N);
			PlayerPrefs.SetString("p2", p2N);
			PlayerPrefs.Save();
		}
	}
}
