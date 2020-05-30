using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using System.Collections.Generic;

public class CountDown : MonoBehaviour
{
	public float time = 180;
	public GameObject screenFader;
	
	private EnemyLeft enemyLeft;	//敵を倒しきったらTIMEが止まるようにする
	// Use this for initialization
	void Start ()
	{
		//初期値60を表示
		//float型からint型へCastし、String型に変換して表示
		GetComponent<Text> ().text = ((int)time).ToString ();
		screenFader.SetActive (false);
		/*timeCanvas = GameObject.Find("TimeCanvas");
		GetComponent<timeCanvas>().enabled = false;*/
		
		enemyLeft = GameObject.Find ("enemyLeft").GetComponent<EnemyLeft> ();
	}
	
	// Update is called once per frame
	void Update ()
	{
		//敵を倒しきったらタイムを減らさない
		if (enemyLeft.enemyCount > 0) {
			//1秒に1ずつ減らしていく
			time -= Time.deltaTime;
			//マイナスは表示しない
			if (time <= 0) {
				screenFader.GetComponent<Animator> ().SetTrigger ("ScreenF");
				GetComponent<Text> ().enabled = false;
				screenFader.SetActive (true);
			}
			if (time <= -5) {
				// .. then reload the currently loaded level.
				Application.LoadLevel ("Stage1");
			}
			GetComponent<Text> ().text = ((int)time).ToString ();
		}
	}
}