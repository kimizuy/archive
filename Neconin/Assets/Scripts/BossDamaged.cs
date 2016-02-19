using UnityEngine;
using System.Collections;

public class BossDamaged : MonoBehaviour
{
	private int bossHealth = 10;

	public GameObject Boss;

	//SpriteRenderer MainSpriteRenderer;

	//public Sprite bossDieSprite;

	/*
	void start ()
	{
		MainSpriteRenderer = gameObject.GetComponent<SpriteRenderer> ();
	}
*/

	void OnTriggerEnter2D (Collider2D col)
	{
		if (col.gameObject.tag == "Bullet") {
			bossHealth -= 1;
			Destroy (col.gameObject);
			Debug.Log ("bossHealth " + bossHealth);
		}

		if (bossHealth <= 0) {
			Application.LoadLevel ("EndRoll");
		}
		/*
		if (bossHealth <= 0) {
			MainSpriteRenderer.sprite = bossDieSprite;
			//Boss.GetComponent<Animator> ().SetTrigger ("BossDie");
			//boss.BossDie ();
			//Boss.GetComponent<Rigidbody2D> ().velocity = transform.up.normalized * -5;
		}
		*/
	}

	void Update ()
	{

	}
}

