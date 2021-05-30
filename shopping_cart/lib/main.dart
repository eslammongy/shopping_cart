import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/bloc/blocs.dart';
import 'package:shopping_cart/bloc/shop_bloc.dart';
import 'package:shopping_cart/widgets/widgets.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ThemeBloc(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Weather',
          theme: state.themeData,
          home: BlocProvider(
            create: (context) => ShoppingBloc(),
            child: ProductHomePage(),
          ),
        );
      },
    );
  }
}
