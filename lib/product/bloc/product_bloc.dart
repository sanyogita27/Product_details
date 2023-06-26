import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:loginform/login/bloc/user_bloc.dart';
import 'package:loginform/product/model/product_model.dart';
import 'package:loginform/product/repo/product_repo.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductStateImpl> {
  final GetProductRepo getproductRepo;
  ProductBloc(this.getproductRepo) : super(ProductInitial()) {
    on<ProductEvent>((event, emit) {});
    on<GetProductEvent>((event, emit) async {
      if (event.isRefresh) {
        emit(state.copyWith(
          status: Status.loading,
          limit: 1,
          total: 0,
          skip: 1,
        ));
      }
      if (state.skip <= state.limit) {
        Either<dynamic, Failure> response =
            await getproductRepo.getProduct(id: event.id);

        response.fold((l) {
          List<ProductModel> productModel = [...state.productModel];
          List<dynamic> resData = l["products"];
          for (var e in resData) {
            productModel.add(ProductModel.fromJson(e));
          }

          emit(state.copyWith(
              productModel: productModel,
              status: Status.success,
              total: l["total"],
              skip: state.skip + 1,
              limit: l["limit"]));
        }, (r) {
          emit(state.copyWith(failure: r, status: Status.error));
        });
      }
    });
  }
}
