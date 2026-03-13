import 'dart:io';

void main(List<String> args) {
  
  List<int> digits = args.map(int.parse).toList();
  int i = digits.length - 1;

  while (i >= 0) {
    if (digits[i] < 9) {
      digits[i]++;
      break;
    } else {
      digits[i] = 0;
      i--;
    }
  }

  if (i < 0) {
    digits.insert(0, 1);
  }

  print(digits);
}