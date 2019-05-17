import 'package:scoped_model/scoped_model.dart';
import 'package:snatok/models/ad.dart';

class AdModel extends Model {
  final List<Ad> _products = [];

  List<Ad> get products {
    return List.from(_products);
  }

  void addAd(Ad product) {
    _products.add(product);
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
}
