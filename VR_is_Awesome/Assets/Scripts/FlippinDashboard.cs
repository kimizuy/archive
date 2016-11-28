using UnityEngine;
using System.Collections;

public class FlippinDashboard : MonoBehaviour {
	private HeadGesture gesture;
	private GameObject dashboard;
	private bool isOpen = true;
	private Vector3 startRotation;

	// Use this for initialization
	void Start () {
		gesture = GetComponent<HeadGesture> ();
		dashboard = GameObject.Find ("Dashboard");
		startRotation = dashboard.transform.eulerAngles;
	}
	
	// Update is called once per frame
	void Update () {
		if (gesture.isFacingDown) {
			OpenDashboard ();
		} else {
			ClosedDashboard ();
		}
	}

	private void ClosedDashboard(){
		if (isOpen) {
			dashboard.transform.eulerAngles = new Vector3 (180.0f, startRotation.y, startRotation.z);
			isOpen = false;
		}
	}

	private void OpenDashboard(){
		if (!isOpen) {
			dashboard.transform.eulerAngles = startRotation;
			isOpen = true;
		}
	}
}
