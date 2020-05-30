using UnityEngine;
using System.Collections;

public class Koban : MonoBehaviour {
	public AudioClip collect;
	private Score score;
	public GameObject hundredPointsUI;
	//private Animator anim;
	
	private bool landed;					// Whether or not the crate has landed.
	
	
	// Use this for initialization
	void Awake () {
		//score = GameObject.Find("Score").GetComponent<Score>();	scoreをstaticにする前に使用してた
		//anim = transform.root.GetComponent<Animator>();
	}
	
	
	
	void OnTriggerEnter2D (Collider2D other)
	{
		// If the player enters the trigger zone...
		if(other.tag == "Bullet")
		{	
			// Destroy the crate.
			Destroy(transform.root.gameObject);
			
		}else if(other.tag == "Player")
		{
			Score.score += 100;
			//score.score += 100;	scoreをstaticにする前に使用してた
			Destroy(transform.root.gameObject);
			// Play the collection sound.
			AudioSource.PlayClipAtPoint(collect,transform.position);
			
			Vector3 scorePos;
			scorePos = transform.position;
			scorePos.y += 1.5f;
			Instantiate(hundredPointsUI, scorePos, Quaternion.identity);
			
			
			
		}
		// Otherwise if the crate hits the ground...
		else if(other.tag == "ground" && !landed)
		{
			// ... set the animator trigger parameter Land.
			//anim.SetTrigger("Land");
			//transform.parent = null;
			//gameObject.AddComponent<Rigidbody2D>();
			landed = true;		
		}
	} 
}
