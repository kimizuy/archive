using UnityEngine;
using System.Collections;

public class Spawner : MonoBehaviour
{
	public float spawnTime = 5f;		// The amount of time between each spawn.
	public float spawnDelay = 3f;		// The amount of time before spawning starts.
	public GameObject[] enemies;		// Array of enemy prefabs.
	
	private EnemyLeft enemyLeft;
	private Animator anim;	
	public GameObject appearance;
	
	
	void Start ()
	{
		//anim = GetComponent<Animator>();
		// Start calling the Spawn function repeatedly after a delay .
		InvokeRepeating("Spawn", spawnDelay, spawnTime);
		enemyLeft = GameObject.Find("enemyLeft").GetComponent<EnemyLeft>();
		
	}
	
	void OnAppear()
	{
		// Create a quaternion with a random rotation in the z-axis.
		Quaternion randomRotation = Quaternion.Euler(0f, 0f, Random.Range(0f, 360f));
		
		// Instantiate the explosion where the rocket is with the random rotation.
		Instantiate(appearance, transform.position, randomRotation);
	}
	
	void Spawn ()
	{

		
		//敵を倒しきったら敵を出現させない
		if (enemyLeft.enemyCount > 0) {
			// Instantiate a random enemy.
			int enemyIndex = Random.Range (0, enemies.Length);
			Instantiate (enemies [enemyIndex], transform.position, transform.rotation);
			
			OnAppear();
			
			// Play the spawning effect from all of the particle systems.
			foreach (ParticleSystem p in GetComponentsInChildren<ParticleSystem>()) {
				p.Play ();
			}
		}
	}
}
