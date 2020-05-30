using UnityEngine;
using System.Collections;

public class StageSelectable : MonoBehaviour {

	// Use this for initialization
	void Start () {

		//"stage1Cleared"の1番目に0が入ってたらボタンが表示される
		gameObject.SetActive(false);
		if(PlayerPrefs.GetInt ("stage1Cleared", 1) == 0){
			gameObject.SetActive(true);
		}

	}
	

}
