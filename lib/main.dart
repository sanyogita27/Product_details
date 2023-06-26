import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginform/product/bloc/product_bloc.dart';
import 'package:loginform/product/repo/product_repo.dart';
import 'package:loginform/product/screen/product_screen.dart';
import 'package:loginform/screen/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: BlocProvider(
            create: (context) => ProductBloc(GetProductRepo()),
            child: const ProductScreen(),
          ),
        ));
  }
}
