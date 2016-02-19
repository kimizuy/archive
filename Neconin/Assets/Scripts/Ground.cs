using UnityEngine;
using System.Collections;

public class Ground : MonoBehaviour {

	bool setOff;
	BoxCollider2D colliderOfGround;

	// Use this for initialization
	void Start () {
	
		colliderOfGround = GetComponent<BoxCollider2D>();
	}
	
	// Update is called once per frame
	void Update () {

			if (setOff) {
				colliderOfGround.enabled = false;
			}
			if (!setOff) {
				colliderOfGround.enabled = true;
			}
		}

	void OnTriggerStay2D (Collider2D col){
		if (col.gameObject.tag == "Player") {
			setOff = true;
		}
	}
	
	void OnTriggerExit2D (Collider2D col)
	{
		if (col.gameObject.tag == "Player") {
			setOff = false;
		}
	}
}
