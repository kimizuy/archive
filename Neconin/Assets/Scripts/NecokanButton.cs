using UnityEngine;
using System.Collections;

public class NecokanButton : MonoBehaviour {

	private Score score;

	public void necokanButton(){
		score = GameObject.Find("Score").GetComponent<Score>();
		score.UseNecokan();
	}
}
