using UnityEngine;
using System.Collections;

public class CanvasEnable : MonoBehaviour {

	public GameObject image;

	// Use this for initialization
	void Start () {
		GetComponent<Canvas>().enabled = false;
	}
	
	// Update is called once per frame
	void Update () {
		if(Time.timeScale == 0){
			GetComponent<Canvas>().enabled = true;
		}

		if(Time.timeScale == 1){
			//image.GetComponent<Animator>().SetTrigger("PauseStart");
			GetComponent<Canvas>().enabled = false;
		}

	}
}
