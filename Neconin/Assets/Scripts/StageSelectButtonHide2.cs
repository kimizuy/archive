using UnityEngine;
using System.Collections;

public class StageSelectButtonHide2 : MonoBehaviour {

	// Use this for initialization
	void Start () {
		gameObject.SetActive(true);
		if(PlayerPrefs.GetInt ("stage2Cleared", 1) == 0){
			gameObject.SetActive(false);
		}
	}
}
