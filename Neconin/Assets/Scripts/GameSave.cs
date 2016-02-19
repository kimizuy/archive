using UnityEngine;
using System.Collections;

public class GameSave : MonoBehaviour {
	
	//public int stage2Cleared = 0;
	//public int stage3Cleared = 0;
	public int stage1ClearCheack;
	public int stage2ClearCheack;
	
	public void stage1ClearedMarker(){
		PlayerPrefs.SetInt ("stage1Cleared", 0);
		
	}
	
	public void stage2ClearedMarker(){
		PlayerPrefs.SetInt ("stage2Cleared", 0);
		
	}
	
	
	void Start(){
		//セーブデータ消去用
		//PlayerPrefs.DeleteAll();
		
			
	}
	void Update (){
		//Debug.Log (stage2ClearCheack);
	}
	
}