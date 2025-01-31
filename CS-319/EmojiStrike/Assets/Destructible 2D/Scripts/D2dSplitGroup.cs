using UnityEngine;
using System.Collections.Generic;

namespace Destructible2D
{
	public class D2dSplitGroup
	{
		public static List<D2dSplitGroup> TempGroups = new List<D2dSplitGroup>();
		
		public List<D2dSplitPixel> Pixels = new List<D2dSplitPixel>();
		
		public byte[] Data;
		
		public D2dRect Rect;
		
		private byte[] tempData;
		
		public void RegenerateData()
		{
			var width   = Rect.Width;
			var total   = width * Rect.Height;
			var offsetX = Rect.XMin;
			var offsetY = Rect.YMin;
			
			if (tempData == null || tempData.Length < total)
			{
				tempData = new byte[total];
			}
			else
			{
				for (var i = 0; i < total; i++)
				{
					tempData[i] = 0;
				}
			}
			
			for (var i = Pixels.Count - 1; i >= 0; i--)
			{
				var pixel = Pixels[i];
				var x     = pixel.X - offsetX;
				var y     = pixel.Y - offsetY;
				
				tempData[x + y * width] = pixel.Alpha;
			}
			
			Data = tempData;
		}
		
		public void GenerateData()
		{
			if (Data == null)
			{
				RegenerateData();
			}
		}
		
		public void CombineData(byte[] prevData, int prevWidth, int prevHeight)
		{
			var dataX      = Rect.XMin;
			var dataY      = Rect.YMin;
			var dataWidth  = Rect.Width;
			var dataHeight = Rect.Height;
			
			if (Data != null && Data.Length >= dataWidth * dataHeight && prevData != null && prevData.Length >= prevWidth * prevHeight)
			{
				for (var y = 0; y < dataHeight; y++)
				{
					for (var x = 0; x < dataWidth; x++)
					{
						var prevX = x + dataX;
						var prevY = y + dataY;
						var dataI = x + y * dataWidth;
						
						if (prevX >= 0 && prevY >= 0 && prevX < prevWidth && prevY < prevHeight)
						{
							var prevI = prevX + prevY * prevWidth;
							var dataA = D2dHelper.ConvertAlpha(    Data[dataI]);
							var prevA = D2dHelper.ConvertAlpha(prevData[prevI]);
							
							Data[dataI] = D2dHelper.ConvertAlpha(dataA * prevA);
						}
						else
						{
							Data[dataI] = 0;
						}
					}
				}
			}
		}
		
		public void AddPixel(int x, int y)
		{
			var pixel = D2dPool<D2dSplitPixel>.Spawn() ?? new D2dSplitPixel();
			
			pixel.Alpha = 255;
			pixel.X = x;
			pixel.Y = y;
			
			Rect.Add(x, y);
			
			Pixels.Add(pixel);
		}
		
		public void AddTriangle(D2dVector2 a, D2dVector2 b, D2dVector2 c)
		{
			if (a.Y != b.Y || a.Y != c.Y)
			{
				//var z = (a.V + b.V + c.V) / 3.0f;
				//var z1 = Vector3.MoveTowards(a.V, z, 1.0f);
				//var z2 = Vector3.MoveTowards(b.V, z, 1.0f);
				//var z3 = Vector3.MoveTowards(c.V, z, 1.0f);
				
				//Debug.DrawLine(z1, z2, Color.red, 10.0f);
				//Debug.DrawLine(z2, z3, Color.red, 10.0f);
				//Debug.DrawLine(z3, z1, Color.red, 10.0f);
				
				// Make a highest, and c lowest
				if (b.Y > a.Y) D2dHelper.Swap(ref a, ref b);
				if (c.Y > a.Y) D2dHelper.Swap(ref c, ref a);
				if (c.Y > b.Y) D2dHelper.Swap(ref b, ref c);
				
				var fth = a.Y - c.Y; // Full triangle height
				var tth = a.Y - b.Y; // Top triangle height
				var bth = b.Y - c.Y; // Bottom triangle height
				
				// Find a to c intercept along b plane
				var inx = c.X + (a.X - c.X) * D2dHelper.Divide(bth, fth);
				var d   = new D2dVector2((int)inx, b.Y);
				
				// Top triangle
				var abs = D2dHelper.Divide(a.X - b.X, tth); // A/B slope
				var ads = D2dHelper.Divide(a.X - d.X, tth); // A/D slope
				
				AddTriangle(b.X, d.X, abs, ads, b.Y, 1, tth);
				
				// Bottom triangle
				var cbs = D2dHelper.Divide(c.X - b.X, bth); // C/B slope
				var cds = D2dHelper.Divide(c.X - d.X, bth); // C/D slope
				
				AddTriangle(b.X, d.X, cbs, cds, b.Y, -1, bth);
			}
		}
		
		public void AddTriangle(float l, float r, float ls, float rs, int y, int s, int c) // left x, right x, left slope, right slope, y, sign, count
		{
			if (l > r)
			{
				D2dHelper.Swap(ref l, ref r);
				D2dHelper.Swap(ref ls, ref rs);
			}
			
			for (var i = 0; i < c; i++)
			{
				var il = Mathf.FloorToInt(l);
				var ir = Mathf.CeilToInt(r);
				
				for (var x = il; x < ir; x++)
				{
					AddPixel(x, y);
				}
				
				y += s;
				l += ls;
				r += rs;
			}
		}
		
		public void Clear()
		{
			for (var i = Pixels.Count - 1; i >= 0; i--)
			{
				D2dPool<D2dSplitPixel>.Despawn(Pixels[i]);
			}
			
			Data = null;
			
			Rect.Clear();
			
			Pixels.Clear();
		}
		
		public static void ClearTempGroups()
		{
			for (var i = TempGroups.Count - 1; i >= 0; i--)
			{
				D2dPool<D2dSplitGroup>.Despawn(TempGroups[i], j => j.Clear());
			}
			
			TempGroups.Clear();
		}
		
		public static D2dSplitGroup AddTempGroup()
		{
			var group = D2dPool<D2dSplitGroup>.Spawn() ?? new D2dSplitGroup();
			
			TempGroups.Add(group);
			
			return group;
		}
	}
}