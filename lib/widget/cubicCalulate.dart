class CubicCalulate {
  static double cubicCal(String data) {
    List<String> temp = data.split("-");
    int length = int.parse(temp[0]);
    int round = int.parse(temp[1]);
    double cubicValue = (((round / 12) * (round / 12) * length) / 16);

    return double.parse(cubicValue.toStringAsFixed(1));
  }
}
