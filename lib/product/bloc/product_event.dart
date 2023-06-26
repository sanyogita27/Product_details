part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class GetProductEvent extends ProductEvent {
  final int id;
  bool isRefresh;
  GetProductEvent({required this.id, this.isRefresh=true});
}
