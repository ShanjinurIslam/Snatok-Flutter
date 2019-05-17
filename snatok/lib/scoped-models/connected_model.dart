import 'package:scoped_model/scoped_model.dart';
import 'package:snatok/models/ad.dart';
import 'package:snatok/models/user.dart';

class MergedModel extends Model {
  final List<Ad> _products = [];
  User _authenticatedUser;

  void addAd(Ad product) {
    product.id = (_authenticatedUser.id);
    product.email = _authenticatedUser.email;
    _products.add(product);
  }
}

class AdModel extends MergedModel {
  bool _showFav = false;

  List<Ad> get AllProducts {
    return List.from(_products);
  }

  List<Ad> get displayProducts {
    if (_showFav) {
      return List.from(_products.where((Ad ad) => ad.isFavorite).toList());
    } else
      return List.from(_products);
  }

  bool get displayMode {
    return _showFav;
  }

  void deleteAd(int index) {
    _products.removeAt(index);
    notifyListeners();
  }

  void replaceAd(int index, Ad product) {
    _products[index] = product;
    notifyListeners();
  }

  void toggleAdFavorite(int index) {
    _products[index].isFavorite = !_products[index].isFavorite;
    notifyListeners();
  }

  void toggleDisplayMode() {
    _showFav = !_showFav;
    notifyListeners();
  }
}

class UserModel extends MergedModel {
  // _ variable indicates we should not access it from outside

  void login(String email, String password) {
    _authenticatedUser =
        new User(id: 'dummy', email: email, password: password);
  }
}
