class MathOps<T, G> {
  dynamic sub(T obj1, G obj2) {
    if (obj1 is String && obj2 is String) {
      return obj1.length - obj2.length;
    }

    if (obj1 is num && obj2 is num) {
      return obj1 - obj2;
    }
  }

  dynamic mul(T obj1, G obj2) {
    if (obj1 is String && obj2 is String) {
      throw Exception("Nu se poate face inmultire pentru String");
    }

    if (obj1 is num && obj2 is num) {
      return obj1 * obj2;
    }
  }
}

void main() {
  var op1 = MathOps<int, int>();
  print(op1.sub(10, 3));
  print(op1.mul(10, 3));

  var op2 = MathOps<double, int>();
  print(op2.sub(8.5, 2));
  print(op2.mul(8.5, 2));

  var op3 = MathOps<String, String>();
  print(op3.sub("hello", "hi"));

  try {
    print(op3.mul("hello", "hi"));
  } catch (e) {
    print(e);
  }
}
