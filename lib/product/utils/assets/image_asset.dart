import 'package:new_architecture/product/enum/asset_ext_enum.dart';

import 'base_asset.dart';

final class ImageAsset implements BaseAsset {
  static ImageAsset get instance => _instance ?? ImageAsset._();
  static ImageAsset? get _instance => ImageAsset._();
  ImageAsset._();

  static _getPath(String value, {AssetExt ext = AssetExt.png}) =>
      "assets/images/$value.${ext.name}";

  final String logo = _getPath("logo", ext: AssetExt.png);
  final String logo2 = _getPath("logo2", ext: AssetExt.jpg);
}
