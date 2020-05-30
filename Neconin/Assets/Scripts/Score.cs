using UnityEngine;
using System.Collections;

public class Score : MonoBehaviour
{
	public static int score = 0;					// The player's score.
	
	private PlayerHealth playerHealth;
	private PlayerControl playerControl;	// Reference to the player control script.
	private int previousScore = 0;			// The score in the previous frame.
	private CountDown countDown;
	
	//scpreを1000使って猫缶を使うことができる
	public void UseNecokan (){
		if(score >= 1000 && playerHealth.health < 100){		//score1000以上でhealth満タンでないこと
			score -= 1000;
			//playerHealth = GameObject.Find("Player").GetComponent<PlayerHealth>();
			playerHealth.NecokanRecovery();
		}
	}

	//残りTIMEを10倍にしてscoreに加算
	public void timeToScore(){
		score += ((int)countDown.time)*10;
	}

	
	void Awake ()
	{
		// Setting up the reference.
		playerControl = GameObject.FindGameObjectWithTag("Player").GetComponent<PlayerControl>();
		playerHealth = GameObject.Find("Player").GetComponent<PlayerHealth>();
		countDown = GameObject.Find("TimeText").GetComponent<CountDown>();
	}
	
	
	void Update ()
	{
		// Set the score text.
		GetComponent<GUIText>().text = "Score: " + score;
		
		// If the score has changed...
		if(previousScore != score)
			// ... play a taunt.
			playerControl.StartCoroutine(playerControl.Taunt());
		
		// Set the previous score to this frame's score.
		previousScore = score;
	}
	
}
