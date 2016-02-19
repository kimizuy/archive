using UnityEngine;
using System.Collections;

public class ButtonScript : MonoBehaviour {

	public void SceneLoad (){
		Application.LoadLevel ("Load");
	}

	public void SceneLoadTitle (){
		Application.LoadLevel ("Title");
	}

	public void SceneLoadSelect (){
		Application.LoadLevel ("SelectStage");
	}

	public void SceneLoadStage1 (){
		Application.LoadLevel ("Level");
	}

	public void SceneLoadStage2 (){
		Application.LoadLevel ("Stage2");
	}

	public void SceneLoadStage3 (){
		Application.LoadLevel ("Stage3");
	}

	// Use this for initialization
	void Start () {
	
	}
	
	// Update is called once per frame
	void Update () {
	
	}
}
