import 'package:flutter/material.dart';
import 'package:service_app/Controller/product_controller.dart';
import 'package:service_app/Screens/Categories/Product_detail/product_detail.dart';
import 'package:service_app/Widgets/container_widget.dart';
import 'package:service_app/Widgets/listview_widget.dart';
import '../../../Constants/App_colors.dart';

class ProductListingAndDetailScreen extends StatefulWidget {
  final int? categoryId;
  final int? subcatId;
  final String? name;
  const ProductListingAndDetailScreen(
      {super.key,
      required this.categoryId,
      required this.subcatId,
      required this.name});

  @override
  State<ProductListingAndDetailScreen> createState() =>
      _ProductListingAndDetailScreenState();
}

class _ProductListingAndDetailScreenState
    extends State<ProductListingAndDetailScreen> {
  List<int> quantities = List.filled(6, 0);
  List<bool> isAddedToCart = List.filled(6, false);

  int _count = 0;
  void increment() {
    setState(() {
      _count++;
    });
  }

  void decrement() {
    setState(() {
      if (_count > 0) {
        _count--;
      }
    });
  }

  ProductController productController = ProductController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                widget.name!,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Divider(thickness: 2, color: AppColors.lightGrey),
              SizedBox(
                height: height * 0.02,
              ),

              //------------------listview builder widget start---------------------///

              FutureBuilder(
                  future: productController.getProducts(
                      catId: widget.categoryId, subCatId: widget.subcatId),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return SizedBox(
                      child: ListviewWidget(
                          scrollDirection: Axis.vertical,
                          itemCount:
                              snapshot.data!.subCategory!.products!.length,
                          decoration: const BoxDecoration(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ProductDetailScreen()));
                               
                              },
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: height * 0.13,
                                      width: width * 0.21,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              snapshot.data!.category!
                                                  .products![index].image
                                                  .toString(),
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Container(
                                        height: height * 0.13,
                                        width: width * 0.7,
                                        decoration: const BoxDecoration(),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data!.category!
                                                  .products![index].name
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(snapshot.data!.category!
                                                .products![index].description
                                                .toString()),
                                            SizedBox(
                                              height: height * 0.04,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(snapshot.data!.category!
                                                    .products![index].amount
                                                    .toString()),
                                                SizedBox(
                                                  width: width * 0.350,
                                                ),
                                                if (isAddedToCart[index])
                                                  Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            if (quantities[
                                                                    index] >
                                                                0) {
                                                              quantities[
                                                                  index]--;
                                                            }
                                                          });
                                                        },
                                                        child: Container(
                                                          height:
                                                              height * 0.030,
                                                          width: width * 0.06,
                                                          decoration: BoxDecoration(
                                                              color: Colors.red,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                          child: const Icon(
                                                              Icons.remove),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: width * 0.01,
                                                      ),
                                                      Text(
                                                        quantities[index]
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 17),
                                                      ),
                                                      SizedBox(
                                                        width: width * 0.01,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            quantities[index]++;
                                                          });
                                                        },
                                                        child: Container(
                                                          height:
                                                              height * 0.030,
                                                          width: width * 0.06,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.green,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                          child: const Icon(
                                                              Icons.add),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                else
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        isAddedToCart[index] =
                                                            true;
                                                        quantities[index] = 1;
                                                      });
                                                    },
                                                    child: ContainerWidget(
                                                      height: height * 0.03,
                                                      width: width * 0.20,
                                                      decoration: BoxDecoration(
                                                        color: AppColors
                                                            .lightgreen,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'Add Cart',
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .white),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                    thickness: 3, color: AppColors.lightGrey),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                              ]),
                            );
                          }),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
