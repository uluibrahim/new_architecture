import 'gif_asset.dart';
import 'icon_asset.dart';
import 'image_asset.dart';

final class AssetConstant {
  static ImageAsset get images => ImageAsset.instance;
  static IconAsset get icons => IconAsset.instance;
  static GifAssset get gif => GifAssset.instance;
}
