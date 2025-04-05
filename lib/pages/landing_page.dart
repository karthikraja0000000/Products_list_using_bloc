import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:productlist_bloc/landing_bloc/products_bloc.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    context.read<ProductsBloc>().add(FetchProducts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Products",
              style: TextStyle(
                color: Colors.red,
                fontFamily: "source-sans-pro",
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 10.h),
            BlocConsumer<ProductsBloc, ProductsState>(
              listener: (context, state) {
                if (state is ProductsFailed) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.error)));
                }
              },
              builder: (context, state) {
                if (state is ProductsLoading) {
                  return CircularProgressIndicator(color: Colors.blueAccent);
                } else if (state is ProductsSuccess) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.products.length,

                      itemBuilder: (context, index) {
                        final products = state.products[index];
                        return Card(
                          // color: Colors.grey,
                          margin: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          elevation: 3,
                          child: ListTile(
                            leading: Image.network(
                              products.image,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                            title: Text(
                              products.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "₹${products.rate.toStringAsFixed(2)}  •  ${products.discount}% Off",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      products.rating.toStringAsFixed(1),
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                   return Text(
                    'NO PRODUCTS FOUND',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "source-sans-pro",
                      fontSize: 16.r,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
