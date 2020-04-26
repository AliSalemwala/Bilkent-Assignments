using UnityEngine;

namespace Destructible2D
{
	// This component allows you to control a spaceship
	[RequireComponent(typeof(Rigidbody2D))]
	public class destroy : MonoBehaviour
	{
		public GameObject BulletPrefab;

		public GameObject manager;
		public int remainingAmmo;

		public GameObject MuzzleFlashPrefab;

		public float ReloadTime;

		public float TurnSpeed;

		public float MoveSpeed;

		public float MaxThrusterScale;

		public float MaxThrusterFlicker;

		public Transform LeftGun;

		public Transform RightGun;

		public Transform LeftThruster;

		public Transform RightThruster;

		private float thrusterScale;

		private float cooldown;
		GameObject instanceOfPlayer;

		private int orientationValue;

		private int shotsFired;

		private Rigidbody2D mainRigidbody;

		void Start()
		{
			instanceOfPlayer = GameObject.Find ("murderer");
			manager = GameObject.Find ("Game Manager");
			remainingAmmo = 100;
		}

		protected virtual void Update()
		{

			orientationValue = instanceOfPlayer.GetComponent<mover> ().orientation;

			// Cool down the gun
			if (manager.GetComponent<manager> ().weaponSelection == 0) {

				cooldown = 1;
			}
			else if (manager.GetComponent<manager> ().weaponSelection == 1) {

				cooldown = 0.2f;
			}
			else if (manager.GetComponent<manager> ().weaponSelection == 2) {

				cooldown = 0.01f;
			}


			cooldown -= Time.deltaTime;

			// Does the player want to shoot?
			if (Input.GetButton("Jump") == true)
			{
				// Is the gun ready to shoot?
				if (cooldown <= 0.0f)
				{
					
					cooldown    = ReloadTime;
					shotsFired += 1;

					// Find the muzzle position
					var muzzlePosition = transform.position;


					// Spawn bullet?
					if (BulletPrefab != null)
					{
						remainingAmmo--;
						Instantiate(BulletPrefab, new Vector3(transform.position.x + 3* orientationValue  , transform.position.y , 0),  Quaternion.Euler(new Vector3(0, 0, -90 * orientationValue )));
					}

					// Spawn muzzle flash?
					if (MuzzleFlashPrefab != null)
					{
						Instantiate(MuzzleFlashPrefab, muzzlePosition,  Quaternion.Euler(new Vector3(0, 0, 1)));
					}
				}
			}
				
		}



	}
}