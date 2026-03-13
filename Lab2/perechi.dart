import 'dart:io';

void main() {
    List<int> numbers = [1, 2, 3, 4, 5, 2, 3, 3, 7]; // (2, 2), (3, 3), (3, 3) -> 2
    Set<int> pairs = {};

    for (int i = 0; i < numbers.length; i++) {
        for (int j = i + 1; j < numbers.length; j++) {
            if (numbers[i] == numbers[j]) {
                pairs.add(numbers[i]);
                break;
            }
        }
    }

    print(pairs.length);
}