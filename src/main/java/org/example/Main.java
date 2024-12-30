package org.example;
import java.util.ArrayDeque;
import java.util.Deque;

public class Main {

    public static String reverseParentheses(String s) {
        Deque<StringBuilder> deque = new ArrayDeque<>();
        StringBuilder current = new StringBuilder();

        for (char ch : s.toCharArray()) {
            if (ch == '(') {
                deque.push(current);
                current = new StringBuilder(); // Start a new substring
            } else if (ch == ')') {
                // Reverse the current substring
                current.reverse();
                // Append to the top element in the deque
                current = deque.pop().append("(").append(current).append(")");
            } else {
                current.append(ch);
            }
        }

        return current.toString();
    }

    public static void main(String[] args) {
        System.out.println(reverseParentheses("abd(jnb)asdf")); // Output: abd(bnj)asdf
        System.out.println(reverseParentheses("abdjnbasdf"));   // Output: abdjnbasdf
        System.out.println(reverseParentheses("dd(df)a(ghhh)")); // Output: dd(fd)a(hhhg)
    }
}
