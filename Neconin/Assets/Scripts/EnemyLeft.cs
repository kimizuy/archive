using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using System.Collections.Generic;

public class EnemyLeft : MonoBehaviour {

	static public int StageNo = 3;
	public float enemyCount;

	//ステージをクリアするために倒さなくてはならない敵の数

	// Use this for initialization
	void Start () {
		enemyCount = 5;
	}
	
	// Update is called once per frame
	void Update () {
		//画面にノルマを表示　初期は「残り：30」
		GetComponent<Text>().text = "Remaining Enemies： " + enemyCount.ToString();


		//ノルマ数倒すと画面内の敵が全滅するが、それがカウントされてマイナス表記になるので
		if (enemyCount < 0) {
			enemyCount = 0;
		}

		/*
		if(enemyCount <= 0){

			StageNo ++;
			//Application.LoadLevel("Stage2");
			Application.LoadLevel(StageNo);
		}
		*/
	}

	//敵を倒すとカウントが１減る
	public void enemyKill(){
		enemyCount --;
	}
}
