using UnityEngine;
using System.Collections;

public class StageSelectable2 : MonoBehaviour {


	void Start () {
		//"stage2Cleared"の1番目に0が入ってたらボタンが表示される
		gameObject.SetActive(false);
		if(PlayerPrefs.GetInt ("stage2Cleared", 1) == 0){
			gameObject.SetActive(true);
		}
		
	}
}
