import '../../enum/asset_ext_enum.dart';
import 'base_asset.dart';

final class IconAsset implements BaseAsset {
  static IconAsset get instance => _instance ?? IconAsset._();
  static IconAsset? get _instance => IconAsset._();
  IconAsset._();

  static String _getPath(String value, {AssetExt ext = AssetExt.png}) =>
      "assets/icons/$value.${ext.name}";

  final String iconExample = _getPath("example");
  final String iconExample2 = _getPath("example2", ext: AssetExt.jpg);
}
