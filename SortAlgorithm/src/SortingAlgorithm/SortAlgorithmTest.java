package SortingAlgorithm;

import java.util.Random;
import java.util.Scanner;

public class SortAlgorithmTest {
	//size of array
	public static int num = 100000;
	//random creater for random value
	public static Random rand = new Random();
	public static char[] list = new char[num]; //unsorted array
	public static char[] qlist = new char[num];
	
	
	public static void view(char[] list) {
		for(int i = 0; i < list.length; i++) {
			if(i%10 == 0) System.out.println();
			System.out.print((int)list[i] + " ");
		}
	}
	public static void creatList(char[] list) {
		for(int i =0; i< num; i++)
			list[i] = (char)(rand.nextInt(num)%255);
	}
	
	public static void listcopy(char[]list, char[] qlist) {
		for(int i = 0; i<list.length; i++)
			qlist[i]= list[i];
	}

	public static void main(String[] args) {
		long start, end, usingTime;
		
		
		/*
		// -------------MergeSort------------------------------------------
		System.out.println("number of array : " + num);
		
		SortAlgorithmTest.creatList(list);
		//SortAlgorithmTest.view(list);
		start = System.currentTimeMillis();
		MergeSort.mergeSort(num, list);
		end = System.currentTimeMillis();
		usingTime = (end - start);
		System.out.print("MergeSort \t\t: " + usingTime+ "ms  and  compare count : ");
		Counter.getCounter();
		System.out.println();
		Counter.setCounter(0);
		
		//SortAlgorithmTest.creatList(list);
		BestOrWorstCase.WorstMergeList(list);
		//SortAlgorithmTest.view(list);
		start = System.currentTimeMillis();
		MergeSort.mergeSort(num, list);
		end = System.currentTimeMillis();
		//SortAlgorithmTest.view(list);
		usingTime = (end - start);
		System.out.print("worst MergeSort \t: " + usingTime+ "ms  and  compare count : ");
		Counter.getCounter();
		System.out.println();
		Counter.setCounter(0);
		
		//SortAlgorithmTest.creatList(list);
		BestOrWorstCase.bestMergeList(list);
		//SortAlgorithmTest.view(list);
		start = System.currentTimeMillis();
		MergeSort.mergeSort(num, list);
		end = System.currentTimeMillis();
		usingTime = end - start;
		System.out.print("best MergeSort \t\t: " + usingTime+ "ms  and  compare count : ");
		Counter.getCounter();
		System.out.println();
		Counter.setCounter(0);
		*//*
		//---------------Quick Sort---------------------------------
		System.out.println("number of array : " + num);
		
		System.out.println();
		SortAlgorithmTest.creatList(list);	listcopy(list, qlist);
		start = System.currentTimeMillis();
		QuickSort.quickSort(0, num, list);
		end = System.currentTimeMillis();
		usingTime = (end - start);
		System.out.print("QuickSort \t\t: " + usingTime+ "ms  and  compare count : ");
		Counter.getCounter();
		System.out.println();
		Counter.setCounter(0);
		
		BestOrWorstCase.worstQuickList(list);
		start = System.currentTimeMillis();
		QuickSort.quickSort(0, num, list);
		end = System.currentTimeMillis();
		usingTime = (end - start);
		System.out.print("worst QuickSort \t: " + usingTime+ "ms  and  compare count : ");
		Counter.getCounter();
		System.out.println();
		Counter.setCounter(0);
		
		//SortAlgorithmTest.creatList(list);
		BestOrWorstCase.bestQuickList(0, num, qlist);
		start = System.currentTimeMillis();
		QuickSort.quickSort(0, num, qlist);
		end = System.currentTimeMillis();
		usingTime = (end - start);
		System.out.print("best QuickSort \t\t: " + usingTime+ "ms  and  compare count : ");
		Counter.getCounter();
		System.out.println();
		Counter.setCounter(0);
		 */
		
		// --------------MergeSort with Exchange
		/*
		System.out.println("number of array : " + num);
		SortAlgorithmTest.creatList(list);
		start = System.currentTimeMillis();
		MergewithExchange.exmergeSort(num, list);
		end = System.currentTimeMillis();
		usingTime = (end - start);
		System.out.print("Merge with Exchange \t: " + usingTime+ "ms and  compare count : ");
		Counter.getCounter();
		System.out.println();
		Counter.setCounter(0);
		*/
		// -----------------Quick with Exchange
		/*
		System.out.println("number of array : " + num);
		SortAlgorithmTest.creatList(list);
		start = System.currentTimeMillis();
		QuickwithExchange.exquickSort(0, num, list);
		end = System.currentTimeMillis();
		usingTime = (end - start);
		System.out.print("Quick with Exchange \t: " + usingTime+ "ms and  compare count : ");
		Counter.getCounter();
		System.out.println();
		Counter.setCounter(0);
		*/
		
		
		// --------------Exchange Sort----------------------------------------

		System.out.println("number of array : " + num);
		SortAlgorithmTest.creatList(list);
		start = System.currentTimeMillis();
		ExchangeSort.exchageSort(list);
		end = System.currentTimeMillis();
		usingTime = (end - start);
		System.out.print("ExchangeSort \t\t: " + usingTime+ "ms  and  compare count : ");
		Counter.getCounter();
		System.out.println();
		Counter.setCounter(0);
		
		Scanner closeconsole = new Scanner(System.in);
		System.out.println("Press to enter to close");
		closeconsole.nextLine();
	}

}
