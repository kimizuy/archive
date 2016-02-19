using UnityEngine;
using System.Collections;
using UnitySampleAssets.CrossPlatformInput;

public class Pauser : MonoBehaviour {
	private bool paused = false;
	
	// Update is called once per frame
	void Update () {
		if(CrossPlatformInputManager.GetButtonDown("Fire3"))
		{
			paused = !paused;
		}
		
		if(paused)
			Time.timeScale = 0;
		else
			Time.timeScale = 1;
	}
}
