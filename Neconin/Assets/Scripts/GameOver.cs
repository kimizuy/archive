using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class GameOver : MonoBehaviour {

	// Use this for initialization
	void Start () {
		gameObject.GetComponent<Text>().enabled = false;
	}
	
	// Update is called once per frame
	void Lose () {
		gameObject.GetComponent<Text>().enabled = true;
	}
}
