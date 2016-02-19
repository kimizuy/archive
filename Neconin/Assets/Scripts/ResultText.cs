using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using System.Collections.Generic;


public class ResultText : MonoBehaviour {
	private CountDown countDown;
	int toScore = 0;

	// Use this for initialization
	void Start () {
		countDown = GameObject.Find("TimeText").GetComponent<CountDown>();

	}
	
	// 残りTIMEをintに変換して10倍にして、TEXTの隣にstringに変換して表示
	void Update () {
		toScore = ((int)countDown.time)*10;
		GetComponent<Text>().text = "TIME x 10　⇒　SCORE: +" + toScore.ToString();
	}

}
