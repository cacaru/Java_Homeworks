package SortingAlgorithm;
import java.util.ArrayList;

public class MergewithExchange {
	
	public static void merge(char[] left, char[] right, char[] sortlist) {
		int i = 0, j = 0, k = 0;
		
		// compare two list and sort ascending order
		while (i < left.length && j < right.length) {
			if (left[i] < right[j]) {
				sortlist[k]=left[i];
				i++; 
			}
			else {
				sortlist[k]=right[j];
				j++;
			}
			Counter.increseCounter();
			k++;
		}
		
		if (i >= left.length) {
			//copy rightlist[j~rightnum] to sortlist[k~ leftnum+rightnum]
			for (int l = j; l < right.length; l++) {
				sortlist[k]=right[l]; k++;
			}
		}
		else {
			//copy leftlist[i~leftnum] to sortlist[k~leftnum+rightnum]
			for (int l = i; l < left.length; l++) {
				sortlist[k] = left[l]; k++;
			}
		}
		
	}
	
	static void exmergeSort(int n, char[] list) {
		if (list.length > 1)
		{
			// l = left half , r = right half
			int l = Math.floorDiv(n, 2);
			int r = n-l;
			
			if(list.length < 50) {
				ExchangeSort.exchageSort(list);
				return;
			}
			
			// devide array
			char[] left = new char[l];
			char[] right = new char[r];
			
			//copy list[1toh] to left[1toh] and list[h+1 to n] to right[1tom];
			for(int i=0; i< l; i++) {
				left[i] = list[i];
			}
			for(int i=l; i<n; i++) {
				right[i-l] = list[i];
			}
								
			MergeSort.mergeSort(l, left);
			MergeSort.mergeSort(r, right);
			MergeSort.merge(left, right, list);
		}
	}

}
