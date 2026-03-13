import 'dart:io';

void main(List<String> args) {

    int n = args.length;
    int sum = 0;

    List<String> letters = [];
    List<int> digits = [];


    for (int i = 0; i < n - 1; i++) {
        if ( i % 2 == 0){
            letters.add(args[i]);
        }
        else {
            digits.add(int.parse(args[i]));
        }
    }

    for (int i = 0 ; i < args[n - 1].length; i++) {
        for (int j = 0; j < letters.length; j++) {
            if (letters[j] == args[n - 1][i]) {
                sum += digits[j];
                break;
            }
        } 
    }

    print(sum);
}