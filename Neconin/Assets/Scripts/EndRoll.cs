using UnityEngine;
using System.Collections;

public class EndRoll : MonoBehaviour
{
	AudioSource audioSource;
	SpriteRenderer MainSpriteRenderer;
	
	public Sprite[] sprites;
	
	
	IEnumerator Start ()
	{
		audioSource = gameObject.GetComponent<AudioSource> ();
		audioSource.Play ();
		
		MainSpriteRenderer = gameObject.GetComponent<SpriteRenderer> ();
		
		int i = 0;
		
		while (i != sprites.Length) {
			yield return new WaitForSeconds (3f);
			MainSpriteRenderer.sprite = sprites [i];
			i++;
		}
		yield return new WaitForSeconds (2f);
		audioSource.Stop ();
	}
}

