part of 'product_bloc.dart';

enum Status { error, initial, success, loading }

abstract class ProductState extends Equatable {
  final List<ProductModel> productModel;
  final Status status;
  final Failure failure;
  final int skip;
  final int limit;
  final int total;
  ProductState(
      {required this.productModel,
      required this.failure,
      required this.status,
      this.total = 0,
      this.limit = 1,
      this.skip = 1});
}

class ProductStateImpl extends ProductState {
  ProductStateImpl(
      {required super.productModel,
      required super.status,
      required super.failure,
      required super.limit,
      required super.skip,
      required super.total});
  ProductStateImpl copyWith({
    List<ProductModel>? productModel,
    Failure? failure,
    Status? status,
    int? total,
    int? skip,
    int? limit,
  }) {
    return ProductStateImpl(
        productModel: productModel ?? this.productModel,
        failure: failure ?? this.failure,
        limit: limit ?? this.limit,
        skip: skip ?? this.skip,
        total: total ?? this.total,
        status: status?? this.status);
  }

  @override
  List<Object> get props => [productModel, failure, skip, total, limit];
}

class ProductInitial extends ProductStateImpl {
  ProductInitial()
      : super(
            failure: Failure(), total: 0, limit: 1, skip: 1, productModel: [],
            status: Status.initial);
}
