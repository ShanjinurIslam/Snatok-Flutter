import 'package:scoped_model/scoped_model.dart';
import 'package:snatok/scoped-models/connected_model.dart';

class MainModel extends Model with MergedModel, AdModel, UserModel {}
