using UnityEngine;
using System.Collections;
using System.Collections.Generic;


namespace Destructible2D
{
	// This component causes the current GameObject to follow the target Transform
	[ExecuteInEditMode]
	[DisallowMultipleComponent]
	[AddComponentMenu(D2dHelper.ComponentMenuPrefix + "Follow")]
	public class D2dFollow : MonoBehaviour
	{
		public Transform Target;
		public Transform Target2;
		private float timePassed;
		private int oddOrEven;

		void Start () {
			timePassed = 30;
			oddOrEven = 0;
		}
		

		public void UpdatePosition()
		{
			if (Target != null&&oddOrEven%2==0)
			{
				var position = transform.position;
				
				position.x = Target.position.x;
				position.y = Target.position.y;
				
				transform.position = position;
			}
			else if (Target2 != null)
			{
				var position = transform.position;
				
				position.x = Target2.position.x;
				position.y = Target2.position.y;
				
				transform.position = position;
			}

		}
		
		protected virtual void Update()
		{
			UpdatePosition();
			if(timePassed > 0){
		timePassed -= Time.deltaTime;
		}
		else{
			timePassed=30;
			oddOrEven++;
		}

		}
	}
}