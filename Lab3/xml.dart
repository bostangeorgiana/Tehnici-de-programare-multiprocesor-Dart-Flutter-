import 'dart:io';
  
class XML{
  
  late int varA;
  late int varB;
  late String varC;
  late List<int> varD;
  late double varE;

  XML(this.varA, this.varB, this.varC, this.varD, this.varE);

  XML.fromXml(String xml) {
    varA = int.parse(xml.split('<varA>')[1].split('</varA>')[0]);
    varB = int.parse(xml.split('<varB>')[1].split('</varB>')[0]);
    varC = xml.split('<varC>')[1].split('</varC>')[0];
    varD = xml
        .split('<varD>')[1]
        .split('</varD>')[0]
        .split(',')
        .map((s) => int.parse(s))
        .toList();
    varE = double.parse(xml.split('<varE>')[1].split('</varE>')[0]);
  }

  
  String toXml(){
    String result = '<Example>\n';
    result += '  <varA>${varA}</varA>\n';
    result += '  <varB>${varB}</varB>\n';
    result += '  <varC>${varC}</varC>\n';
    result += '  <varD>${varD.join(',')}</varD>\n';
    result += '  <varE>${varE}</varE>\n';
    result += '</Example>\n';
    return result;
  }
}

void main()
{
  XML xml = XML(10, 20, 'Salut', [1, 3, 5, 7], 3.14);
  print(xml.toXml());

  String xmlString = '''
<Example>
  <varA>1</varA>
  <varB>2</varB>
  <varC>Hello</varC>
  <varD>10,20,30</varD>
  <varE>2.71</varE>
</Example>
''';

  XML xmlFromString = XML.fromXml(xmlString);
  print(xmlFromString.toXml());
}