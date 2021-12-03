/// Auto Size Config.
class AutoSizeConfig {
  static double _designWidth = 360;
  static double _designHeight = 640;

  static double get designWidth => _designWidth;

  static double get designHeight => _designHeight;

  /// Configuration design draft size  screen width, height, density.
  static void setDesignWH({double? width, double? height}) {
    _designWidth = width ?? _designWidth;
    _designHeight = height ?? _designHeight;
  }
}
