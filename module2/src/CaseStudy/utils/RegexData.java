package CaseStudy.utils;

import java.util.Scanner;

public class RegexData {
    static Scanner scanner = new Scanner(System.in);
    public static String regexStr(String temp, String regex, String error){
        boolean check = true;
        do {
            if(temp.matches(regex)) {
                check = false;
            } else {
                System.out.print(error);
                temp = scanner.nextLine();
            }
        } while (check);
        return temp;
    }
}
