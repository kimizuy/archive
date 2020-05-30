using UnityEngine;
using System.Collections;

public class BukiDisp : MonoBehaviour {

	public void kunaiDisp(){
		transform.FindChild("BukiDisp (1)").gameObject.SetActive(true);
		transform.FindChild("BukiDisp").gameObject.SetActive(false);
	}

	public void shurikenDisp(){
		transform.FindChild("BukiDisp").gameObject.SetActive(true);
		transform.FindChild("BukiDisp (1)").gameObject.SetActive(false);
	}

	// Use this for initialization
	void Start () {
		transform.FindChild("BukiDisp").gameObject.SetActive(false);
		
	}

}
