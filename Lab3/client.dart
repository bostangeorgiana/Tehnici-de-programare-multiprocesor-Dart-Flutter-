import 'dart:io';

class Client{
  final String name;
  double PurchasesAmount = 0;

  Client(this.name);
  
  void add(double amount){
    PurchasesAmount += amount;
  }

  double get(){
    return PurchasesAmount;
  }

}

class LoyalClient extends Client{
  LoyalClient(String name) : super(name);
  double LoyalAmount = 0;

  double get_dicaunt(){
    return LoyalAmount;
  }

  void discount(){
    LoyalAmount = super.get() * 0.9;
  }

}

main(){
  Client c = Client('John');
  c.add(100);
  c.add(50);
  print(c.get());

  LoyalClient lc = LoyalClient('Jane');
  lc.add(200);
  lc.discount();
  print(lc.get_dicaunt());
}