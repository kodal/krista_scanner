class Item {
  final String barcode;
  final String articul;
  final int modelId;
  final int nomenclatureId;
  final int colorId;
  final String colorName;
  final String sizeValue;
  final int amount;
  final int partsCount;
  final DateTime date;

  Item({
    this.barcode,
    this.articul,
    this.modelId,
    this.nomenclatureId,
    this.colorId,
    this.colorName,
    this.sizeValue,
    this.amount,
    this.partsCount,
    this.date,
  });

  Item.fromJson(Map<String, dynamic> json)
      : barcode = json['barcode'],
        articul = json['articul'],
        modelId = json['modelId'],
        nomenclatureId = json['nomenclatureId'],
        colorId = json['colorId'],
        colorName = json['colorName'],
        sizeValue = json['sizeValue'],
        amount = json['amount'],
        partsCount = json['partsCount'],
        date = json['date'];

  Map<String, dynamic> toJson() => {
        'barcode': barcode,
        'articul': articul,
        'modelId': modelId,
        'nomenclatureId': nomenclatureId,
        'colorId': colorId,
        'colorName': colorName,
        'sizeValue': sizeValue,
        'amount': amount,
        'partsCount': partsCount,
        'date': date,
      };
}
