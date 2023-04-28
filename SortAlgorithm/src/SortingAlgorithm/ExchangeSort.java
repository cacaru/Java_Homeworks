package SortingAlgorithm;

public class ExchangeSort {
	
	public static void exchageSort(char[] list) {
		int pointer = 0;
		for(pointer = 0; pointer < list.length; pointer++) {
			for(int i = 0; i< list.length; i++) {
				if(list[pointer] < list[i]) {
					ExchangeSort.swap(list, pointer, i);
					Counter.increseCounter();
				}
			}
		}
	}
	
	public static void swap(char[] list, int i, int j) {
		char temp = list[i];
		list[i] = list[j];
		list[j] = temp;
	}
}
