part of 'add_product_bloc.dart';

@immutable
abstract class AddProductEvent {}

class ProductAddEvent extends AddProductEvent {
  ProductAddEvent({
    required this.proName,
    required this.proDec,
    required this.proPrice,
    required this.image,
  });
  String proName;
  String proDec;
  double proPrice;
  XFile image;
}

class DeleteProductEvent extends AddProductEvent {
  DeleteProductEvent({required this.proId});
  String proId;
}

class UpdateProductEvent extends AddProductEvent {
  UpdateProductEvent({required this.proName,required this.ProDec,required this.proPrice});
  String proName;
  String ProDec;
  String proPrice;
}
