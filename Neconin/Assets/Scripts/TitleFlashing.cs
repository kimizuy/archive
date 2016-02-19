using UnityEngine;
using System.Collections;
using UnityEngine.UI;

public class TitleFlashing : MonoBehaviour {
	
	private GameObject _Start;
	// Alpha増減値(点滅スピード調整)
	private float _Step = 0.025f;
	
	void Start()
	{
		this._Start = GameObject.Find("Button");
	}
	
	void Update()
	{
		// 現在のAlpha値を取得
		float toColor = this._Start.GetComponent<Image>().color.a;
		// Alphaが0 または 1になったら増減値を反転
		if (toColor < 0 || toColor > 1)
		{
			_Step = _Step * -1;
		}
		// Alpha値を増減させてセット
		this._Start.GetComponent<Image>().color = new Color(255, 255, 255, toColor + _Step);
	}
}
