package com.company;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        int currentYear, birthYear, age;
        Scanner sc = new Scanner (System.in);
        System.out.println("What is the current year");
        currentYear = sc.nextInt();
        System.out.println("What is your birth year");
        birthYear = sc.nextInt();
        System.out.println(currentYear);
        System.out.println(birthYear);
        age = currentYear-birthYear;
        System.out.println("You are " + age + " years old.");
    }
}
