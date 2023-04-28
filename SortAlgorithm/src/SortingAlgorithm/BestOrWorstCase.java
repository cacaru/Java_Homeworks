package SortingAlgorithm;

public class BestOrWorstCase {
	public static void bestMergeList(char[] list) {
		//MergeSort�� ����Ʈ ���̽��� ������� ���ĵǾ��ִ� ���¿��� �����ϴ� ���̴�.
		// ���� ���� ����Ʈ�� ���� ������ �°� �������ָ� best case�� �ȴ�.
		//���� ����� ���� n�� ���� �� �̻��϶��� mergesort�� ������, �����϶��� QuickSort�� �����Ƿ�
		//list�� ũ�⿡ ���� ����ϴ� ������ �޸� ����Ѵ�.
		// �������� 10������ �������� 10�� ���ϸ� QuickSort��,
		// 10���� �ʰ���� MergeSort�� ����Ѵ�.
		if( list.length > 100000) 
			MergeSort.mergeSort(list.length, list);
		else
			QuickSort.quickSort(0, list.length, list);
		Counter.setCounter(0);
	}
	
	public static void WorstMergeList(char[] list) {
		//MergeSort�� �־��� ���� ���� ���� ��Ƚ���� ������ ������ �ɰ��̴�.
		//�̶��� ��Ƚ���� �ɰ��� ��� �迭�� �ִ� ��ġ�� ���ذ��� �����ϴ� ���� �ɰ��̴�.
		//�̷л� ���� ���� ��Ƚ���� ������ ���� Ȧ���� ¦���� ������ �̸� ������ ū�� �� ������ �ݺ��ؼ� ����ִ� ���ϰ��̴�.
		//1���� 8������ ���� �迭�� �ִٰ� �Ҷ�, 15372648�� ������ ���ĵǾ� �ִٰ� �Ѵٸ�, 
		//���ݾ� ������ ���ĵǾ� 1357 2468 �� ����� ���̰� �̴� �ٽ� ���� ���Ŀ��� ��� �ѹ����� ���ϴ� �迭�� �� ���̴�.
		
		// ���� ���ʿ� ���ĵ� ���ڵ��� Ȧ�� ¦���� ���� ��, �̸� �ٽ� ������ �ɰ��� left1ȸ right1ȸ�� �迭�� ������
		//�ɰ��̴�.
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
		//quick sort�� worst case �� ���ĵǾ� �ִ� �迭�� sort�Ϸ��� �ϴ� ���̴�
		//���� �̹� ������ bestMergeList�� �̿��Ͽ�, ���ĵ� ����Ʈ�� ������ �����ϰڴ�.
		BestOrWorstCase.bestMergeList(list);
	}
	
	public static void bestQuickList(int low, int high, char[] list) {
		// quick sort�� best case �� �ּ����� �񱳸� ���� �����̹Ƿ�
		// �̸� �Ǻ� ����Ʈ�� ���� �Ǿ��ִ� �迭�� ���� ���� ���̶�� �����ȴ�.
		// �Ǻ�����Ʈ�� ���� �Ǿ��ִٸ�, ���� �ÿ�  �� ���� �迭 �����⸦ ���� �̸� ��Ƚ���� ���̴� ���̴�.
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
