package _11_dsa_stack_queue.bai_tap.chuyen_doi_thap_phan_sang_nhi_phan;

import java.util.Stack;

public class DecimalToBinary {
    public static String convertToBinary (int decimal) {
        String stringBinary = "";
        Stack<Integer> stack = new Stack<>();
        int surPlus;
        while (decimal != 0) {
            surPlus = decimal % 2;
            stack.push(surPlus);
            decimal = decimal/2;
        }
        int size = stack.size();
        for(int i=0; i<size; i++){
            stringBinary += stack.pop();
        }
        return stringBinary;
    }

    public static void main(String[] args) {
        DecimalToBinary a = new DecimalToBinary();
        System.out.println(a.convertToBinary(111));
    }
}