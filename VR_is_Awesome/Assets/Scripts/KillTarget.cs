﻿using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class KillTarget : MonoBehaviour {
	public GameObject target;
	public ParticleSystem hitEffect;
	public GameObject killEffect;
	public float timeToSelect = 3.0f;
	public int score;
	public Text scoreText;

	private ParticleSystem.EmissionModule hitEffectEmission;
	private float countDown;

	void Start () {
		score = 0;
		countDown = timeToSelect;
		hitEffectEmission = hitEffect.emission;
		hitEffectEmission.enabled = false;
		scoreText.text = "Score: 0";
	}

	void Update () {
		Transform camera = Camera.main.transform;
		Ray ray = new Ray (camera.position, camera.rotation * Vector3.forward);
		RaycastHit hit;
		if (Physics.Raycast (ray, out hit) && (hit.collider.gameObject == target)) {
			if (countDown > 0.0f) {
				//的中した際の処理
				countDown -= Time.deltaTime;
				hitEffect.transform.position = hit.point;
				hitEffectEmission.enabled = true;
			} else {
				//殺された際の処理
				Instantiate (killEffect, target.transform.position, target.transform.rotation);
				score += 1;
				scoreText.text = "Score: " + score;
				countDown = timeToSelect;
				SetRandomPosition ();
			} 
		} else {
				//リセットする
				countDown = timeToSelect;
				hitEffectEmission.enabled = false;
			}	
	}
	void SetRandomPosition(){
		float x = Random.Range (-5.0f, 5.0f);
		float z = Random.Range (-5.0f, 5.0f);
		target.transform.position = new Vector3 (x, 0.0f, z);
	}
}
