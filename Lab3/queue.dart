// Queue (push(), pop(), back(), front(), isEmpty(), toString()).
import 'dart:io';

class Queue{
  List queue = [];

  void push(item){
    queue.add(item);
  }

  void pop(){
    if(queue.isNotEmpty){
      queue.removeAt(0);
    }
  }

  bool isEmpty(){
    int lenght = queue.length;
    if(lenght == 0){
      return true;
    } else {
      return false; 
    }
  }

  dynamic back(){
    return queue[queue.length-1];
  }

  dynamic front(){
    return queue[0];
  }

  String toString(){
    String result = '[';
    for(int i=0; i<queue.length-1; i++){
      result += '${queue[i]}, ';
    }
    if(queue.length>0){
      result += '${queue[queue.length-1]}';
    }
    result += ']';
    return result;
  }

}

main(){
  Queue q = Queue();
  print('Is empty: ${q.isEmpty()}');
  q.push(1);
  q.push(2);
  q.push(3);
  print(q.toString());
  print('Back: ${q.back()}');
  print('Front: ${q.front()}');
  q.pop();
  print(q.toString());
  print('Is empty: ${q.isEmpty()}');
}