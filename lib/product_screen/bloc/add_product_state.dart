part of 'add_product_bloc.dart';

@immutable
abstract class AddProductState {}

class AddProductInitial extends AddProductState {}

class ProductAddedSucess extends AddProductState {}

class ProductAddedFiled extends AddProductState {
  ProductAddedFiled();
}

class ProductDeleteSucess extends AddProductState {}

class ProductDeleteFiled extends AddProductState {}

class ProductUpdateSucess extends AddProductState {}

class  ProductUpdateFailed extends AddProductState {
  
}
