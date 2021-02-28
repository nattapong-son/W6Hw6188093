import 'package:routing/main.dart';
import 'package:scoped_model/scoped_model.dart';

class CartSum extends Model{
  List<productInfo> cart = [];
  int TotalSum = 0;

  int get total => cart.length;

  void addCart(productInfo){
    int index = cart.indexWhere((i) => i.id == productInfo.id);
    if (index != -1)
      updateproduct(productInfo, productInfo.qyt + 1);
    else {
      cart.add(productInfo);

      TotalPrice();
      notifyListeners();
    }
  }

  void removeProduct(productInfo){
    int index = cart.indexWhere((i) => i.id == productInfo.id);
    cart[index].qyt = 1;
    cart.removeWhere((items) => items.id == productInfo.id);

    TotalPrice();
    notifyListeners();

  }

  void updateproduct (productInfo, qyt){
    int index = cart.indexWhere((i) => i.id == productInfo.id);
    cart[index].qyt = 1;
    if(cart[index].qyt == 0)
      removeProduct(productInfo);
  }

  void TotalPrice(){
    TotalSum = 0;
    cart.forEach((c) {
      TotalSum += c.cost * c.qyt;
    });
  }

}

