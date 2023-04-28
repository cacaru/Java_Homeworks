package SortingAlgorithm;

public class Counter {
	private static int counter = 0;
	private static int overcount = 0;
	public static void getCounter() {
		if( overcount != 0) {
			 System.out.print(Integer.MAX_VALUE +"*"+ overcount +"+"+counter);
		}
		else
			System.out.print(counter);
	}
	public static void increseCounter() {
		counter += 1;
		if(counter >= Integer.MAX_VALUE) {
			overcount++; counter = 0;
		}
	}
	public static void setCounter(int i) {
		counter = i;
	}
}