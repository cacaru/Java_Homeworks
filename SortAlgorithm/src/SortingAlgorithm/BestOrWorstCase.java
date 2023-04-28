package SortingAlgorithm;

public class BestOrWorstCase {
	public static void bestMergeList(char[] list) {
		//MergeSort의 베스트 케이스는 순서대로 정렬되어있는 상태에서 정렬하는 것이다.
		// 따라서 들어온 리스트를 숫자 순서에 맞게 정렬해주면 best case가 된다.
		//실험 결과에 따라 n이 일정 값 이상일때는 mergesort가 빠르고, 이하일때는 QuickSort가 빠르므로
		//list의 크기에 따라 사용하는 정렬을 달리 사용한다.
		// 기준점은 10만개를 기준으로 10만 이하면 QuickSort를,
		// 10만개 초과라면 MergeSort를 사용한다.
		if( list.length > 100000) 
			MergeSort.mergeSort(list.length, list);
		else
			QuickSort.quickSort(0, list.length, list);
		Counter.setCounter(0);
	}
	
	public static void WorstMergeList(char[] list) {
		//MergeSort의 최악의 경우는 가장 많은 비교횟수를 가지는 정렬이 될것이다.
		//이때의 비교횟수는 쪼개진 모든 배열을 최대 수치로 비교해가며 정렬하는 것이 될것이다.
		//이론상 가장 많은 비교횟수를 가지는 것은 홀수와 짝수로 나눈뒤 이를 작은값 큰값 의 순서로 반복해서 집어넣는 것일것이다.
		//1부터 8까지의 숫자 배열이 있다고 할때, 15372648의 순서로 정렬되어 있다고 한다면, 
		//절반씩 나뉘어 정렬되어 1357 2468 로 저장될 것이고 이는 다시 최종 정렬에서 모두 한번씩을 비교하는 배열이 될 것이다.
		
		// 따라서 최초에 정렬된 숫자들을 홀수 짝수로 나뉜 뒤, 이를 다시 반으로 쪼개어 left1회 right1회로 배열을 넣으면
		//될것이다.
		//BestOrWorstCase.bestMergeList(list);
		//SortAlgorithmTest.view(list);
		//System.out.println();

		char[] odd = new char[list.length];
		char[] even = new char[list.length];
		
		char[] left =  new char[list.length];
		char[] right = new char[list.length];


		int oddNum=0, evenNum = 0;
		int i = 0, j = 0;
		int counter = 0;
		// grouping odd number and even number 
		for( i = 0; i < list.length; i++) {
			if( list[i] %2 == 1) {
				odd[oddNum] = list[i];
				oddNum++;
			}
			else {
				even[evenNum] = list[i];
				evenNum++;
			}
		}

		// odd sort -------------------------------------
		int half = Math.floorDiv(oddNum, 2);

		int leftIdx = 0, rightIdx = 0;
		// divide half odd number and resort
		for(i = 0; i < half; i++) {
			left[leftIdx] = odd[i];
			leftIdx++;
		}
		for(i = half; i< oddNum; i++) {
			right[rightIdx] = odd[i];
			rightIdx++;
		}

		i=0; j=0;
		for(counter = 0; counter<oddNum; counter++) {
			if( counter % 2 == 1) {
				if( i == leftIdx) {
					break;
				}
				odd[counter] = left[i];
				i++;
			}
			else {
				if( j == rightIdx ) {
					break;
				}
				odd[counter] = right[j];
				j++;
			}
		}
		if( i == leftIdx && j != rightIdx) {
			for(;j < rightIdx; j++)
				odd[counter++] = right[j];
		}
		else {
			for(;i<leftIdx; i++)
				odd[counter++] = left[i];
		}

		// even sort ---------------------------------
		half = Math.floorDiv(evenNum, 2);
		
		leftIdx = 0; rightIdx = 0;
		// divide half even number and resort
		for( i = 0; i < half; i++) {
			left[leftIdx] = even[i];
			leftIdx++;
		}
		for( i = half; i< evenNum; i++) {
			right[rightIdx] = even[i];
			rightIdx++;
		}

		i =0; j = 0;
		for(counter = 0; counter<evenNum; counter++) {
			if( counter % 2 == 1) {
				if( i == leftIdx) {
					break;
				}
				even[counter] = right[j];
				j++;
			}
			else {
				if( j == rightIdx ) {
					break;
				}
				even[counter] = left[i];
				i++;
			}
		}
		if( i == leftIdx && j != rightIdx) {
			for(;j < rightIdx; j++)
				even[counter++] = right[j];
		}
		else {
			for(;i<leftIdx; i++)
				even[counter++] = left[i];
		}
		

		j = 0;
		for(i = 0; i< oddNum; i++)
			list[i] = odd[i];

		for(i=oddNum; i<list.length; i++) {
			list[i] = even[j++];
		}
		Counter.setCounter(0);
	}
	
	public static void worstQuickList(char[] list) {
		//quick sort의 worst case 는 정렬되어 있는 배열을 sort하려고 하는 것이다
		//따라서 이미 구현한 bestMergeList를 이용하여, 정렬된 리스트를 빠르게 구현하겠다.
		BestOrWorstCase.bestMergeList(list);
	}
	
	public static void bestQuickList(int low, int high, char[] list) {
		// quick sort의 best case 는 최소한의 비교를 통한 연산이므로
		// 미리 피봇 포인트가 선점 되어있는 배열이 가장 빠를 것이라고 생각된다.
		// 피봇포인트가 선점 되어있다면, 정렬 시에  더 빠른 배열 나누기를 통해 미리 비교횟수를 줄이는 것이다.
		int pivotPoint;
		if( high > low) {
			pivotPoint = bestpartition(low,high, list);
			bestQuickList(low, pivotPoint, list);
			bestQuickList(pivotPoint+1, high, list);
		}
	}
	public static int bestpartition(int low, int high, char[] list) {
		int i, nextPivot;
		char pivotitem;
		pivotitem = list[low];
		nextPivot = low;
	
		for( i= low+1; i< high; i++) {
			if( list[i] <= pivotitem )
				++nextPivot;
		}
		//exchange list[low] and list[nextPivot]
		BestOrWorstCase.swap(list, low, nextPivot);
		return nextPivot;
	}
	
	public static void swap(char[] list, int i, int j) {
		char temp = list[i];
		list[i] = list[j];
		list[j] = temp;
	}
}
