import 'base_asset.dart';

final class GifAssset implements BaseAsset {
  static GifAssset get instance => _instance ??= GifAssset._();
  static GifAssset? _instance;
  GifAssset._();

  static String _getPath(String value) => "assets/gifs/$value.gif";

  final String gifExample = _getPath("example");
}
