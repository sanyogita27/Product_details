// import 'package:bloc/bloc.dart';
// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:loginform/login/bloc/user_bloc.dart';
// import 'package:loginform/product/bloc/product_bloc.dart';
// import 'package:loginform/product/model/product_model.dart';
// import 'package:loginform/search_product/search_repo.dart';

// part 'search_product_event.dart';
// part 'search_product_state.dart';

// class SearchProductBloc
//     extends Bloc<SearchProductEvent, SearchProductStateImpl> {
//   final SearchRepo searchRepo;
//   List<ProductModel> search = [];
//   SearchProductBloc(this.searchRepo) : super(SearchProductInitial()) {
//     on<SearchProductEvent>((event, emit) {});

//     on<GetSearchProductEvent>((event, emit) async {
//       if (event.phone.isNotEmpty && state.product != event.phone) {
//         if (event.isRefresh) {
//           emit(state.copyWith(
//               status: Status.loading,
//               limit: 1,
//               skip: 1,
//               total: 0,
//               product: []));
//         }
//         if (state.skip <= state.limit) {
//           Either<dynamic, Failure> response =
//               await searchRepo.getSearchRepo(phone: event.phone);
//           response.fold((l) {
//             List<dynamic> data = l["products"];
//             List<ProductModel> product = [];
//             for (var e in data) {
//               product.add(ProductModel.fromJson(e));
//             }
//             product.addAll(search.where((element) => element.title!
//                 .toLowerCase()
//                 .contains(event.phone.toLowerCase())));
//             emit(state.copyWith(
//               product: product,
//               status: Status.success,
//               skip: state.skip + 1,
//               total: l["total"],
//               limit: l["limit"],
//             ));
//           }, (r) {
//             emit(state.copyWith(
//               product: search,
//             ));
//           });
//         }
//       } else {
//         emit(state.copyWith(product: []));
//       }
//     });
//   }
// }
