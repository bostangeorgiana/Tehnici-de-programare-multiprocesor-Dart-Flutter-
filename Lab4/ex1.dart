import 'dart:io';

String secventa(RegExp regula, String text, int x) {
  List<String> rezultat = [];
  Iterable<RegExpMatch> gasite = regula.allMatches(text);
  for (RegExpMatch cuv in gasite) {
    if (cuv[0]!.length >= x) rezultat.add(cuv.group(0)!);
  }
  return rezultat.join(' ');
}

main() {
  String text = 'Ana are 100 mere, 7 prune si 75 pere';
  RegExp regula = RegExp(r'\d+');
  print(secventa(regula, text, 2));
}
