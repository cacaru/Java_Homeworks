package SortingAlgorithm;

public class MergeSort {
	
	public static void merge(char[] left, char[] right, char[] list) {
		int i = 0, j = 0, k = 0;
		
		// compare two list and sort ascending order
		while (i < left.length && j < right.length) {
			if (left[i] <= right[j]) {
				list[k] = left[i];
				i++; 
			}
			else {
				list[k] = right[j];
				j++;
			}
			k++; Counter.increseCounter();
		}
		
		if (i >= left.length) {
			//copy rightlist[j~rightnum] to sortlist[k~ leftnum+rightnum]
			for (int m = j; m < right.length; m++, k++) {
				list[k] = right[m];
			}
		}
		else {
			//copy leftlist[i~leftnum] to sortlist[k~leftnum+rightnum]
			for (int m = i; m < left.length; m++, k++) {
				list[k] = left[m]; 
			}
		}
		
	}
	
	// n is number of list 
	static void mergeSort(int n, char[] list) {
		int j = 0;
		if (n > 1)
		{
			// l = left half , r = right half
			int l = Math.floorDiv(n, 2);
			int r = n-l;
			
			// devide array
			char[] left = new char[l];
			char[] right = new char[r];
			if( l + r == n) {
			//copy list[1toh] to left[1toh] and list[h+1 to n] to right[1tom];
				for(int i=0; i< l; i++) {
					left[i] = list[i];
				}
				for(int i=l; i<n; i++, j++) {
					right[j] = list[i];
				}
			}

			MergeSort.mergeSort(l, left);
			MergeSort.mergeSort(r, right);
			MergeSort.merge(left, right, list);
		}
	}

}
