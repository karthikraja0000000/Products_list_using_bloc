import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:productlist_bloc/repositary/api_repositary.dart';

import '../model/model_class.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepo repository;

  ProductsBloc({required this.repository}) : super(ProductsInitial()) {
    on<ProductsEvent>((event, emit) async {
      if (event is FetchProducts) {
        emit(ProductsLoading());
        try {
          final products = await repository.fetchProducts();
          emit(ProductsSuccess(products: products));
        } catch (e) {
          emit(ProductsFailed(error: e as String));
        }
      }
    });
  }
}
