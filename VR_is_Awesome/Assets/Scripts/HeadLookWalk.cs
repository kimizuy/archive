using UnityEngine;
using System.Collections;

public class HeadLookWalk : MonoBehaviour {
	public float velocity = 0.7f;

	private CharacterController controller;

	void Start () {
		controller = GetComponent<CharacterController>();
	}

	// Update is called once per frame
	void Update () {
		controller.SimpleMove (Camera.main.transform.forward * velocity);
	}
}
