import 'package:scoped_model/scoped_model.dart';
import 'package:snatok/scoped-models/ads.dart';
import 'package:snatok/scoped-models/user.dart';

class MainModel extends Model with UserModel, AdModel {}
