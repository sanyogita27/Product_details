import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginform/product/bloc/product_bloc.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(GetProductEvent(id: 1));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductStateImpl>(
      builder: (context, state) {
        return state.status == Status.success
            ? ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                shrinkWrap: true,
                itemCount: state.productModel.length,
                itemBuilder: (context, index) {
                  return Container(
                    
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all()),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(state.productModel[index].brand ?? ""),
                        Text(state.productModel[index].category ?? ""),
                        Text(state.productModel[index].price.toString())
                      ],
                    ),
                  );
                })
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
