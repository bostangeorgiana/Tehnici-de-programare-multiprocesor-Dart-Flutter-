import 'dart:io';

class Stiva {
  String path = 'stiva.txt';

  void push(String element) {
    File(path).writeAsStringSync('$element\n', mode: FileMode.append);
  }

  String pop() {
    File f = File(path);

    List<String> lines = f.readAsLinesSync();
    if (lines.isNotEmpty) {
      String last = lines.removeLast();
      f.writeAsStringSync(lines.join('\n') + (lines.isNotEmpty ? '\n' : ''));
      return last;
    } else {
      return 'Stiva este goala';
    }
  }

  String top() {
    File f = File(path);

    List<String> lines = f.readAsLinesSync();
    return lines.last;
  }
}

main() {
  Stiva s = Stiva();
  s.push('Element1');
  s.push('Element2');
  print(s.pop());
}
