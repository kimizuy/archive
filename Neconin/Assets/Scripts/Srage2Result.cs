using UnityEngine;
using System.Collections;

public class Srage2Result : MonoBehaviour {

	private EnemyLeft enemyLeft;
	private Score score;
	private bool onlyOnce = false;
	private GameSave gameSave;
	
	
	
	
	// Use this for initialization
	void Start () {
		GetComponent<Canvas>().enabled = false;		//最初は非表示
		gameSave = GameObject.Find ("GameSaver").GetComponent<GameSave>();	//ゲームセーブ用
		enemyLeft = GameObject.Find ("enemyLeft").GetComponent<EnemyLeft>();	//enemyLeftのEnemycountを使う準備
		score = GameObject.Find ("Score").GetComponent<Score>();
		transform.FindChild("Button").gameObject.SetActive(false);//scoreが加算される前にボタンを押してしまうのを防ぐ
	}
	
	// 1回だけ行うようにonlyOnceを条件に追加
	void Update () {
		if (enemyLeft.enemyCount <= 0 && onlyOnce == false) {
			StartCoroutine ("resultOrder");
			onlyOnce = true;
		}
	}
	
	
	private IEnumerator resultOrder() {
		if (enemyLeft.enemyCount <= 0 && onlyOnce == false) {
			//Time.timeScale = 0.2f;
			yield return new  WaitForSeconds(3);
			
			//Time.timeScale = 1;
			GetComponent<Canvas>().enabled = true;	//敵を全滅させると表示
			yield return new  WaitForSeconds(2);
			//countDown.TimeResult();		//TIMEを0にする
			score.timeToScore();	//残りTIMEを一遍にScoreに追加
			yield return new WaitForSeconds(1);
			//↓scoreが加算される前にボタンを押してしまうのを防ぐ
			transform.FindChild("Button").gameObject.SetActive(true);
			gameSave.stage2ClearedMarker();	//stage2をクリアしたらセーブ
		}
		
	}
}


