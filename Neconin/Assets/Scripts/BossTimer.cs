using UnityEngine;
using System.Collections;
using UnityEngine.UI;
using System.Collections.Generic;

public class BossTimer : MonoBehaviour
{
	public float bossTime = 180;
	public GameObject boss;
	
	
	// Use this for initialization
	void Start ()
	{

	}
	
	// Update is called once per frame
	void Update ()
	{
		//1秒に1ずつ減らしていく
		bossTime -= Time.deltaTime;

		if (bossTime <= 170) {
			boss.GetComponent<Animator> ().SetTrigger ("BossAppearance");
		}
		if (bossTime <= 160) {
			boss.GetComponent<Animator> ().SetTrigger ("BossMove");
		}
	}
}