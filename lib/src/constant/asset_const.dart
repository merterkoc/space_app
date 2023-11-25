class SpaceIcon {
  static filledIcon(String path) {
    return path.replaceAll('.png', '_filled.png');
  }

  static const String event = 'assets/images/icon_png/event_icon.png';
  static const String news = 'assets/images/icon_png/news_icon.png';
  static const String space = 'assets/images/icon_png/space_icon.png';

  const SpaceIcon._();
}

extension SpaceIconX on String {
  String get filledIcon => SpaceIcon.filledIcon(this);
}
