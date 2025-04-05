import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productlist_bloc/landing_bloc/products_bloc.dart';
import 'package:productlist_bloc/pages/landing_page.dart';
import 'package:productlist_bloc/repositary/api_repositary.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsBloc(repository: ProductRepo()),
        ),
      ],
      child: ScreenUtilInit(
        designSize: Size(360, 800),
        builder: (context , child){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: LandingPage(),
          );
        },
      )
    );
  }
}
