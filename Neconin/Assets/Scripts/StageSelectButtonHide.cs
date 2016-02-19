using UnityEngine;
using System.Collections;

public class StageSelectButtonHide : MonoBehaviour {

	// Use this for initialization
	void Start () {
		gameObject.SetActive(true);
		if(PlayerPrefs.GetInt ("stage1Cleared", 1) == 0){
			gameObject.SetActive(false);
		}
	}
	

}
