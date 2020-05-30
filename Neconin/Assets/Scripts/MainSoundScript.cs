using UnityEngine;
using System.Collections;

public class MainSoundScript : MonoBehaviour
{
	AudioSource audioSource;
	public bool DontDestroyEnabled = true;
	
	// Use this for initialization
	void Start ()
	{
		audioSource = gameObject.GetComponent<AudioSource> ();
		
		if (DontDestroyEnabled) {
			// Sceneを遷移してもオブジェクトが消えないようにする
			DontDestroyOnLoad (this);
		}
	}
	
	// Update is called once per frame
	void Update ()
	{
		if (Application.loadedLevelName == "Title" 
			|| Application.loadedLevelName == "SelectStage") {
			
			if (Input.GetMouseButtonDown (0)) {
				audioSource.Play ();
			}
		}
	}
}