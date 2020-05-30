using UnityEngine;
using System.Collections;
using UnitySampleAssets.CrossPlatformInput;

public class Gun : MonoBehaviour
{
	public Rigidbody2D rocket;				// Prefab of the rocket.
	public Rigidbody2D bomb;
	public float speed = 20f;				// The speed the rocket will fire at.
	
	
	private PlayerControl playerCtrl;		// Reference to the PlayerControl script.
	private Animator anim;	
	
	public int weaponType = 0;
	float coolTime = 0;
	//private ShurikenSwitch shurikenSwitch;
	//private KunaiSwitch kunaiSwitch;
	// Reference to the Animator component.
	
	public void ChangeWeapon01 (){
		weaponType = 0;
		
	}
	
	public void ChangeWeapon02 (){
		weaponType = 1;
		
	}
	
	void Awake()
	{
		// Setting up the references.
		anim = transform.root.gameObject.GetComponent<Animator>();
		playerCtrl = transform.root.GetComponent<PlayerControl>();
		//shurikenSwitch = GameObject.Find ("ShurikenButton").GetComponent<ShurikenSwitch>();
		//shurikenSwitch2 = GameObject.Find ("KunaiButton").GetComponent<ShurikenSwitch>();
		//kunaiSwitch = GameObject.Find ("KunaiButton").GetComponent<KunaiSwitch>();
	}
	
	
	IEnumerator weapon1Shot(){
		//for(int i = 0; i < 3; i++){　3連射用
		anim.SetTrigger("Shoot");
		GetComponent<AudioSource>().Play();
		
		// If the player is facing right...
		if(playerCtrl.facingRight)
		{
			// ... instantiate the rocket facing right and set it's velocity to the right. 
			Rigidbody2D bulletInstance = Instantiate(rocket, transform.position, Quaternion.Euler(new Vector3(0,0,0))) as Rigidbody2D;
			bulletInstance.velocity = new Vector2(speed, 0);
			Rigidbody2D bulletInstance1 = Instantiate(rocket, transform.position, Quaternion.Euler(new Vector3(0,0,0))) as Rigidbody2D;
			bulletInstance1.velocity = new Vector2(speed, 5);
			Rigidbody2D bulletInstance2 = Instantiate(rocket, transform.position, Quaternion.Euler(new Vector3(0,0,0))) as Rigidbody2D;
			bulletInstance2.velocity = new Vector2(speed, -5);
			
			
		}
		else
		{
			// Otherwise instantiate the rocket facing left and set it's velocity to the left.
			Rigidbody2D bulletInstance = Instantiate(rocket, transform.position, Quaternion.Euler(new Vector3(0,0,180f))) as Rigidbody2D;
			bulletInstance.velocity = new Vector2(-speed, 0);
			Rigidbody2D bulletInstance1 = Instantiate(rocket, transform.position, Quaternion.Euler(new Vector3(0,0,180f))) as Rigidbody2D;
			bulletInstance1.velocity = new Vector2(-speed, 5);
			Rigidbody2D bulletInstance2 = Instantiate(rocket, transform.position, Quaternion.Euler(new Vector3(0,0,180f))) as Rigidbody2D;
			bulletInstance2.velocity = new Vector2(-speed, -5);
		}
		yield return new WaitForSeconds (1f);
		//}　上記forの連射用
	}
	
	IEnumerator weapon2Shot(){
		for(int i = 0; i < 3; i++){
			anim.SetTrigger("Shoot");
			GetComponent<AudioSource>().Play();
			
			// If the player is facing right...
			if(playerCtrl.facingRight)
			{
				// ... instantiate the rocket facing right and set it's velocity to the right. 
				Rigidbody2D bulletInstance = Instantiate(bomb, transform.position, Quaternion.Euler(new Vector3(0,0,0))) as Rigidbody2D;
				bulletInstance.velocity = new Vector2(speed, 0);
				/*　3wayショット用
			Rigidbody2D bulletInstance1 = Instantiate(rocket, transform.position, Quaternion.Euler(new Vector3(0,0,0))) as Rigidbody2D;
			bulletInstance1.velocity = new Vector2(speed, 5);
			Rigidbody2D bulletInstance2 = Instantiate(rocket, transform.position, Quaternion.Euler(new Vector3(0,0,0))) as Rigidbody2D;
			bulletInstance2.velocity = new Vector2(speed, -5);
			*/
				
			}
			else
			{
				// Otherwise instantiate the rocket facing left and set it's velocity to the left.
				Rigidbody2D bulletInstance = Instantiate(bomb, transform.position, Quaternion.Euler(new Vector3(0,0,180f))) as Rigidbody2D;
				bulletInstance.velocity = new Vector2(-speed, 0);
				/*　3wayショット用
			Rigidbody2D bulletInstance1 = Instantiate(rocket, transform.position, Quaternion.Euler(new Vector3(0,0,0))) as Rigidbody2D;
			bulletInstance1.velocity = new Vector2(speed, 5);
			Rigidbody2D bulletInstance2 = Instantiate(rocket, transform.position, Quaternion.Euler(new Vector3(0,0,0))) as Rigidbody2D;
			bulletInstance2.velocity = new Vector2(speed, -5);
			*/
			}
			yield return new WaitForSeconds (0.1f);
		}
	}
	
	void Update ()
	{
		// If the fire button is pressed...
		
		coolTime -= 2 * Time.deltaTime;
		if(CrossPlatformInputManager.GetButtonDown("Fire1"))
		{
			if(weaponType == 0 && coolTime < 0){
				
				StartCoroutine("weapon1Shot");
				coolTime = 1;
				
				
			}
			
			if(weaponType == 1&& coolTime < 0){
				
				StartCoroutine("weapon2Shot");
				coolTime = 1;
			}
			
		}
	}
}
