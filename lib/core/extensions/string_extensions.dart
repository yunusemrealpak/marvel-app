extension StringExtensions on String {
  String checkLength(int limit) {
    if (this.length > limit) {
      return this.substring(0, limit) + "...";
    } else
      return this;
  }
  
  String get simpleDate {
    var date = DateTime.parse(this);
    return "${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year.toString().padLeft(2, '0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}";
  }
}
