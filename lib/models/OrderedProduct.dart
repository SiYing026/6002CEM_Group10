import 'Model.dart';

class OrderedProduct extends Model {
  static const String PRODUCT_UID_KEY = "product_uid";
  static const String ORDER_DATE_KEY = "order_date";
  static const String BOOKING_DATE_KEY = "booking_date";

  String productUid;
  String orderDate;
  String bookingDate;
  OrderedProduct(
    String id, {
    this.productUid,
    this.orderDate,
        this.bookingDate,
  }) : super(id);

  factory OrderedProduct.fromMap(Map<String, dynamic> map, {String id}) {
    return OrderedProduct(
      id,
      productUid: map[PRODUCT_UID_KEY],
      orderDate: map[ORDER_DATE_KEY],
      bookingDate: map[BOOKING_DATE_KEY],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      PRODUCT_UID_KEY: productUid,
      ORDER_DATE_KEY: orderDate,
      BOOKING_DATE_KEY: bookingDate,
    };
    return map;
  }

  @override
  Map<String, dynamic> toUpdateMap() {
    final map = <String, dynamic>{};
    if (productUid != null) map[PRODUCT_UID_KEY] = productUid;
    if (orderDate != null) map[ORDER_DATE_KEY] = orderDate;
    if (bookingDate != null) map[BOOKING_DATE_KEY] = bookingDate;
    return map;
  }
}
