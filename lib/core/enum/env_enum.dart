enum EnvEnum {
  BASE_URL,
  PRIVATE_KEY,
  PUBLIC_KEY,
}

extension EnvExtension on EnvEnum {
  String get name {
    return this.toString().split(".")[1];
  }
}