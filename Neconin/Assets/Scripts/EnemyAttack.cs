using UnityEngine;
using System.Collections;

public class EnemyAttack : MonoBehaviour {

	private Animator anim;

	// Use this for initialization
	void Awake ()
	{
		anim = GetComponent<Animator>();

	}

	void OnCollisionEnter2D (Collision2D col)
	{
			if (col.gameObject.tag == "Player") {
			anim.SetBool ("Attack", true);
		} 
	}

	void OnCollisionExit2D (Collision2D col)
	{
		if (col.gameObject.tag == "Player") {
			anim.SetBool ("Attack", false);
		} 
	}
}
