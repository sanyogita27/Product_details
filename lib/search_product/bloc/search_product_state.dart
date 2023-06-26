// part of 'search_product_bloc.dart';

// abstract class SearchProductState extends Equatable {
//   final Failure failure;
//   final List<ProductModel> product;
//   final Status status;
//   final int total;
//   final int skip;
//   final int limit;
//   const SearchProductState(
//       {required this.failure, required this.product, required this.status,
//        this.total= 0,  this.limit =1,
//        this.skip =1});
// }

// class SearchProductStateImpl extends SearchProductState {
//   SearchProductStateImpl(
//       {required super.failure, required super.product, required super.status,
//       required super.limit, required super.skip, required super.total});
//   SearchProductStateImpl copyWith(
//       {List<ProductModel>? product, Failure? failure, Status? status, int? total, int? skip, int? limit}) {
//     return SearchProductStateImpl(
//         failure: failure ?? this.failure,
//         product: product ?? this.product,
//         status: status ?? this.status,
//         total: total?? this.total,
//         skip: skip?? this.skip,
//         limit: limit?? this.limit,
        
//         );
//   }

//   @override
//   List<Object> get props => [failure, product, status, total, skip, limit];
// }

// class SearchProductInitial extends SearchProductStateImpl {
//   SearchProductInitial()
//       : super(failure: Failure(), product: [], status: Status.initial,
//       total: 0,
//       skip: 1,
//       limit: 1);
// }
