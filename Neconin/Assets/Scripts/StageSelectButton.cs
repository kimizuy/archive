using UnityEngine;
using System.Collections;

public class StageSelectButton : MonoBehaviour {



	public void toSceneOneSwitch(){
		Application.LoadLevel("Stage1");
		
	}

	public void toSceneTwoSwitch(){
		Application.LoadLevel("Stage2");
		
	}

	public void toSceneThreeSwitch(){
		Application.LoadLevel("Stage3");
		
	}


}
