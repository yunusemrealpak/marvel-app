enum Routes {
  APP,
  HOME,
  DETAIL,
}

extension RouteExtensions on Routes {
  String get name {
    return this.toString().split(".")[1];
  }
}

extension RouteStringExtensions on String {
  Routes? get route {
    switch (this) {
      case "APP":
        return Routes.APP;
      case "HOME":
        return Routes.HOME;
      case "DETAIL":
        return Routes.DETAIL;
      default:
    }
  }
}