using UnityEngine;
using System.Collections;

public class Boss : MonoBehaviour
{
	public GameObject bossBullet;
	
	public Sprite bossDieSprite;

	public BossDamaged bossDamaged;

	// Use this for initialization
	void Start ()
	{
		bossDamaged = GetComponent<BossDamaged> ();
	}


	// Update is called once per frame
	void BossAttackEvent ()
	{
		// 子要素を全て取得する
		for (int i = 0; i < transform.childCount; i++) {
			
			Transform shotPosition = transform.GetChild (i);
			
			Instantiate (bossBullet, shotPosition.position, shotPosition.rotation);
			
		}
	}

	/*
	void Update(){

		if (bossDamaged.bossHealth <= 0) {
			MainSpriteRenderer.sprite = bossDieSprite;
			//Boss.GetComponent<Animator> ().SetTrigger ("BossDie");
			//boss.BossDie ();
			//Boss.GetComponent<Rigidbody2D> ().velocity = transform.up.normalized * -5;
		}
	}
	*/
}
