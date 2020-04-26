using UnityEngine;



	// This component allows you to control a spaceship
	[RequireComponent(typeof(Rigidbody2D))]
	public class destroyer2 : MonoBehaviour
	{
		public GameObject BulletPrefab;

		public GameObject manager;
		public int ammo;

		public GameObject MuzzleFlashPrefab;

		public float ReloadTime;
		public float spread;

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
		}

		protected virtual void Update()
		{

			ammo = instanceOfPlayer.GetComponent<mover>().ammo;

			orientationValue = instanceOfPlayer.GetComponent<mover> ().orientation;

			// Cool down the gun
			if (manager.GetComponent<manager> ().weaponSelection == 0) {

				ReloadTime = 1;
				spread = 0; //kivanc special is very accurate
			}
			else if (manager.GetComponent<manager> ().weaponSelection == 1) {
				
				ReloadTime = 0.10f;
				spread = Random.Range (-5.0f, 5.0f);
			}
			else if (manager.GetComponent<manager> ().weaponSelection == 2) {

				ReloadTime = 0.01f;
				spread = Random.Range (-20.0f, 20.0f);
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
				if (BulletPrefab != null && ammo > 0)
					{
				if(instanceOfPlayer.GetComponent<mover> ().orientation == 1){
						ammo--;
						Instantiate(BulletPrefab, new Vector3((transform.position.x + 2)* instanceOfPlayer.GetComponent<mover> ().orientation  , transform.position.y , 0),  Quaternion.Euler(new Vector3(0, 0, -90 * instanceOfPlayer.GetComponent<mover> ().orientation    + spread)));
}
else{
	ammo--;
						Instantiate(BulletPrefab, new Vector3((transform.position.x - 2), transform.position.y , 0),  Quaternion.Euler(new Vector3(0, 0, -90 * instanceOfPlayer.GetComponent<mover> ().orientation    + spread)));
}

					instanceOfPlayer.GetComponent<mover>().ammo--;
					}

					// Spawn muzzle flash?
					if (MuzzleFlashPrefab != null)
					{
					if(instanceOfPlayer.GetComponent<mover> ().orientation == 1){
					Instantiate(MuzzleFlashPrefab, new Vector3((transform.position.x + 2)* instanceOfPlayer.GetComponent<mover> ().orientation  , transform.position.y , 0),  Quaternion.Euler(new Vector3(0, 0, 1)));
	}
	else{
		Instantiate(MuzzleFlashPrefab, new Vector3((transform.position.x - 2), transform.position.y , 0),  Quaternion.Euler(new Vector3(0, 0, 1)));
	}
					}
				}
			}

		}



	}
