using UnityEngine;
using System.Collections;
using UnityEngine.UI; 

public class HpBarCtrl: MonoBehaviour {

	private PlayerHealth playerHealth;
	Slider _slider;
	float _hp;

	void Start () {
		// スライダーを取得する
		_slider = GameObject.Find("Slider").GetComponent<Slider>();
		playerHealth = GameObject.Find ("Player").GetComponent<PlayerHealth>();
	}
	

	void Update () {
		// HP上昇
		_hp = playerHealth.health;

		_slider.value = _hp;
		/*
		if(_hp > _slider.maxValue) {
			// 最大を超えたら0に戻す
			_hp = _slider.minValue;
		}
		
		// HPゲージに値を設定
		_slider.value = _hp;
		*/
	}
}