

using UnityEngine.UI;
using UnityEngine;
using System.Collections;

public class Example : MonoBehaviour {
	public int numObjects = 2;
	public GameObject pic;

	void Start() {
		Vector3 center = transform.position;
		for (int i = 0; i < numObjects; i++){
			Vector3 pos = RandomCircle(center, 5.0f);
			Quaternion rot = Quaternion.FromToRotation(Vector3.forward, center-pos);
			Instantiate(pic, pos, rot);
		}
	}

	Vector3 RandomCircle ( Vector3 center ,   float radius  ){
		float ang = Random.value * 360;
		Vector3 pos;
		pos.x = center.x + radius * Mathf.Sin(ang * Mathf.Deg2Rad);
		pos.y = center.y + radius * Mathf.Cos(ang * Mathf.Deg2Rad);
		pos.z = center.z;
		return pos;
	}
}


/*using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;


public class Scroll : MonoBehaviour {

	public GameObject itemPrefab;
	public int itemCount = 10, columnCount = 1;

	void Awake () {
		
		 

		RectTransform rowRectTransform = itemPrefab.GetComponent<RectTransform>();
		RectTransform containerRectTransform = gameObject.GetComponent<RectTransform>();

		//calculate the width and height of each child item.
		float width = containerRectTransform.rect.width / columnCount;
		float ratio = width / rowRectTransform.rect.width;
		float height = rowRectTransform.rect.height * ratio;
		int rowCount = itemCount / columnCount;
		if (itemCount % rowCount > 0)
			rowCount++;

		//adjust the height of the container so that it will just barely fit all its children
		float scrollHeight = height * rowCount;
		containerRectTransform.offsetMin = new Vector2(containerRectTransform.offsetMin.x, -scrollHeight / 2);
		containerRectTransform.offsetMax = new Vector2(containerRectTransform.offsetMax.x, scrollHeight / 2);

		int j = 0;
		for (int i = 0; i < itemCount; i++)
		{
			//this is used instead of a double for loop because itemCount may not fit perfectly into the rows/columns
			if (i % columnCount == 0)
				j++;

			//create a new item, name it, and set the parent
			GameObject newItem = Instantiate(itemPrefab) as GameObject;
			newItem.name = gameObject.name + " item at (" + i + "," + j + ")";
			newItem.transform.SetParent(gameObject.transform, false);

			//move and size the new item
			RectTransform rectTransform = newItem.GetComponent<RectTransform>();

			float x = -containerRectTransform.rect.width / 2 + width * (i % columnCount);
			float y = containerRectTransform.rect.height / 2 - height * j;
			rectTransform.offsetMin = new Vector2(x, y);

			x = rectTransform.offsetMin.x + width;
			y = rectTransform.offsetMin.y + height;
			rectTransform.offsetMax = new Vector2(x, y);
		}
	}
}

class ReadFromFile
{
	static string[] Main()
	{
		string[] lines = System.IO.File.ReadAllLines(@"/Users/kivancgumus/EmojiMenu/Assets/scroll.txt");

		foreach (string line in lines)
			Console.WriteLine(line);

		return lines;
		// Keep the console window open in debug mode.
//		Console.WriteLine("Press any key to exit.");
//		System.Console.ReadKey();
	}
}*/