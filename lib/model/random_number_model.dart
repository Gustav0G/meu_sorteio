class RandomNumberModel {
  final int? minValue;
  final int? maxValue;
  final int? qtdNumbers;
  final String? numberResult;

  RandomNumberModel(
      {this.minValue, this.maxValue, this.numberResult, this.qtdNumbers});

  factory RandomNumberModel.fromMap(Map<String, dynamic> map) {
    return RandomNumberModel(
      minValue: map['minValue'],
      maxValue: map['maxValue'],
      qtdNumbers: map['qtdNumbers'],
      numberResult: map['numberResult'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'qtdNumbers': qtdNumbers,
      'minValue': minValue,
      'maxValue': maxValue,
      'numberResult': numberResult,
    };
  }
}
