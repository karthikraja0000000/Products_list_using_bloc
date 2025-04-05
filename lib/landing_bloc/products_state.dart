part of 'products_bloc.dart';

abstract class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState{}

final class ProductsSuccess extends ProductsState{
  final List<Product> products;

  ProductsSuccess({ required this.products});
}

final class ProductsFailed extends ProductsState{
  final String error;

  ProductsFailed({required this.error});

}
