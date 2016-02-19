using UnityEngine;
using System.Collections;

public class Weapon02 : MonoBehaviour {
	private Gun gun;
	private BukiDisp bukiDisp;
	
	public void OnClick(){
		
		gun.ChangeWeapon02();
		
		bukiDisp.shurikenDisp();
		//shurikenSwitch = GameObject.Find ("ShurikenButton").GetComponent<ShurikenSwitch>();
	}
	
	void Start(){
		gun = GameObject.Find("Gun").GetComponent<Gun>();
		bukiDisp = GameObject.Find ("BukiDisplay").GetComponent<BukiDisp>();
	}
	
}
