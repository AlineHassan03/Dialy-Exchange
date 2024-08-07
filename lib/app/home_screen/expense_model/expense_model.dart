class ExpenseModel {
  String? details;
  String? count;
  String? price;
  String? category;
  String? datetime;
  String? time;
  int? id;

  ExpenseModel(
      {this.details,
      this.datetime,
      this.category,
      this.price,
      this.count,
      this.time,
      this.id});

  Map<String, dynamic> toMap() => {
        'details': details,
        'count': count,
        'price': price,
        'category': category,
        'datetime': datetime,
        'time': time,
      };

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
        id: map['id'],
        details: map['details'],
        time: map['time'],
        count: map['count'],
        price: map['price'],
        category: map['category'],
        datetime: map['datetime']);
  }
}
