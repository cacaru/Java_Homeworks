package SortingAlgorithm;

public class QuickSort {

	// low -- start index, high -- end index
	public static void quickSort(int low, int high, char[] list) {
		int pivotPoint;	

		if( high > low) {
			pivotPoint = partition(low,high, list);
			quickSort(low, pivotPoint, list);
			quickSort(pivotPoint+1, high, list);
		}
	}
	
	public static int partition(int low, int high, char[] list) {
		int i, nextPivot, j;
		char pivotitem;
		pivotitem = list[low];
		nextPivot = low;
		j = low+1;
		
		for( i= low+1; i< high; i++) {
			if( list[i] <= pivotitem ) {
				//exchange list[i] and list[j]   and j++
				QuickSort.swap(list, i, j);
				++nextPivot; j++;				
			}
			Counter.increseCounter();
		}
		//exchange list[low] and list[nextPivot]
		QuickSort.swap(list, low, nextPivot);
		return nextPivot;
	}
	
	public static void swap(char[] list, int i, int j) {
		char temp = list[i];
		list[i] = list[j];
		list[j] = temp;
	}
	
}
