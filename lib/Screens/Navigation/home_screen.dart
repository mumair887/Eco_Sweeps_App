import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:service_app/Controller/category_controller.dart';
import 'package:service_app/Models/search_model.dart';
import 'package:service_app/Screens/SubCategories/custom_subcategory_screen.dart';
import 'package:service_app/Widgets/custom_textformfield.dart';
import '../../Constants/app_colors.dart';
import '../../Controller/search_api.dart';

class UcScreen extends StatefulWidget {
  const UcScreen({super.key});

  @override
  State<UcScreen> createState() => _UcScreenState();
}

class _UcScreenState extends State<UcScreen> {
  TextEditingController searchController = TextEditingController();

  SearchModel searchResults = SearchModel();
  bool isLoading = false;
  CategoryController categoryController = CategoryController();
  SearchProductsApi searchProduct = SearchProductsApi();
  List maintain = [
    'assets/paint.jpg',
    'assets/main.jpg',
    'assets/tank.jpg',
  ];
  List maintaindetail = [
    "Home Painting",
    'Maintainance',
    "Water Tank Cleaning",
  ];
  List ladies = [
    'assets/wo1.jpg',
    'assets/wo2.jpg',
    'assets/lash.jpg',
    'assets/wo4.jpg',
    'assets/wo5.jpg',
    'assets/wo6.jpg',
    'assets/wo7.jpg',
  ];
  List ladiesdetail = [
    "Hair Care",
    "Women's Spa",
    'Lashes and Brows',
    'Spray Training',
    'Nail Extensions',
    'Womens Saloon',
    'Luxury Women Saloon'
  ];
  List ac = [
    'assets/duct.jpg',
    'assets/split.jpg',
    'assets/window.jpg',
  ];
  List acdetail = [
    "Duct/Central AC",
    'Split AC',
    "Window AC",
  ];
  List cleaning = [
    'assets/homeclean.jpg',
    'assets/shoec.jpg',
    'assets/deep.jpg',
    'assets/acclean.jpg',
  ];
  List cleaningdetail = [
    "Home Cleaning",
    'Shoe Cleaning',
    "Deep Clean",
    'AC Cleaning',
  ];
  List acservices = [
    'assets/ac ser.jpg',
    'assets/pani.jpg',
    'assets/oven.jpg',
    'assets/frej.jpg',
    'assets/machine.jpg'
  ];
  List salonwomen1 = [
    'assets/wave.jpg',
    'assets/ref.jpg',
    'assets/w2.jpg',
    'assets/w3.jpg',
    'assets/w4.jpg',
  ];
  List salonwomen2 = [
    'assets/w5.jpg',
    'assets/w6.jpg',
    'assets/w1.jpg',
  ];
  List wo = [
    'assets/physio.jpg',
    'assets/nurse.jpg',
    'assets/consult.jpg',
    'assets/pcr.jpg',
    'assets/flu.jpg',
    'assets/phys coun.jpg',
    'assets/labtest.jpg',
    'assets/therapy.jpg'
  ];
  List wodetail = [
    "Physchotherapy\nat Home",
    "Nurse care at Home",
    'Doctor Consultation',
    'PCR Test at Home',
    'Flu Vaccine at Home',
    'Physchother\nand Counsling',
    'Lab Tests at Home',
    'IV Therapy at Home'
  ];
  List mostbook = [
    'assets/vacuum.png',
    'assets/laundry-machine.png',
    'assets/woman (1).png',
    'assets/man.png',
    'assets/maintainance.png',
    'assets/car-wash.png',
    'assets/air.png',
    'assets/pest-control.png',
    'assets/healthcare.png',
    'assets/vehicle.png',
    'assets/repair-shop.png',
    'assets/mattress.png',
    'assets/gardening.png',
    'assets/apliance.jpg',
    'assets/cooking.png',
    'assets/car re.jpg',
    'assets/movers p.png',
    'assets/rent p.png',
    'assets/kids.jpg'
  ];
  final List<String> crouselpics = [
    'assets/first.jpg',
    'assets/second.jpg',
    'assets/third.jpg',
    'assets/fourth.jpg',
    'assets/fifth.jpg',
    'assets/2ndlast.jpg',
    'assets/last.jpg'
  ];

  List appservices = [
    'Cleaning',
    'Laundry',
    'ladies',
    'Mens Saloon',
    'Maintainance',
    'Car wash at home/office',
    'Ac Repair',
    'Pest Control',
    'Health care at home',
    'Car on rent',
    'Car repair',
    'Furniture cleaning',
    'Gardner',
    'Appliances repair',
    'Chef',
    'Recovery Vehicle',
    'Movers & Packers',
    'Loading Vehicle',
    'Kids Saloon'
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          // ignore: unnecessary_null_comparison
          : searchResults == null
              ? const Center(
                  child: Text('No search results'),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SafeArea(
                          child: Column(
                            children: [
                              // Location, Cart section
                              ListTile(
                                title: const Text(
                                  'Multan',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: const Text(
                                    'Sabzazar Colony-Multan-Pakistan'),
                                trailing: CircleAvatar(
                                  backgroundColor: AppColors
                                      .lightGrey, // Use AppColors.lightgreen here
                                  child:
                                      const Icon(Icons.shopping_cart_outlined),
                                ),
                              ),
                              SizedBox(height: height * 0.02),

                              // Search bar
                              CustomTextFormField(
                                controller: searchController,
                                hintText: 'Look for services',
                                bordercolor: AppColors.black,
                                prefixIcon: Icons.search,
                                onFieldSubmitted: (v) {
                                  searchProduct.search(v);
                                },
                                onChanged: (p0) {
                                  searchProduct.search(p0);
                                },
                              ),

                              SizedBox(height: height * 0.02),

                              // First services section
                              FutureBuilder(
                                future: categoryController.fetchCategory(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }

                                  return GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: snapshot.data!.data!.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing: 10,
                                      mainAxisExtent: 130,
                                      mainAxisSpacing: 10,
                                      crossAxisCount: 3,
                                    ),
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CustomSubCategoryScreen(
                                                catId: snapshot
                                                    .data!.data![index].id,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          height: height * 0.15,
                                          width: width * .40,
                                          decoration: const BoxDecoration(),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: height * 0.10,
                                                width: width * .27,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black),
                                                  color: Colors.grey[
                                                      200], // Use AppColors.lightGrey
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                      snapshot.data!
                                                          .data![index].image
                                                          .toString(),
                                                    ),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                snapshot.data!.data![index].name
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),

                              Divider(
                                  thickness: 5,
                                  color: AppColors
                                      .lightGrey), // Use AppColors.lightGrey

                              // Carousel slider section
                              CarouselSlider(
                                items: crouselpics.map((item) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(item)),
                                    ),
                                  );
                                }).toList(),
                                options: CarouselOptions(
                                  height: height * .23,
                                  enlargeCenterPage: true,
                                  autoPlay: true,
                                  aspectRatio: 16 / 9,
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enableInfiniteScroll: true,
                                  autoPlayAnimationDuration:
                                      const Duration(milliseconds: 600),
                                  viewportFraction: 0.8,
                                ),
                              ),

                              Divider(thickness: 5, color: AppColors.lightGrey),

                              // Healthcare section
                              SizedBox(height: height * 0.02),
                              buildSection(
                                context,
                                'Healthcare at home',
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: wo.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return buildHorizontalCard(
                                      height,
                                      width,
                                      wo[index],
                                      wodetail[index],
                                    );
                                  },
                                ),
                              ),

                              const Divider(thickness: 5, color: Colors.grey),

                              // Cleaning section
                              buildSection(
                                context,
                                'Cleaning',
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 4,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return buildHorizontalCard(
                                      height,
                                      width,
                                      cleaning[index],
                                      cleaningdetail[index],
                                    );
                                  },
                                ),
                              ),

                              Divider(thickness: 5, color: AppColors.lightGrey),

                              // AC Repair section
                              buildSection(
                                context,
                                'AC Repair',
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: 3,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return buildHorizontalCard(
                                      height,
                                      width,
                                      ac[index],
                                      acdetail[index],
                                    );
                                  },
                                ),
                              ),

                              Divider(
                                  thickness: 5,
                                  color: AppColors
                                      .lightGrey), // Use AppColors.lightGrey

                              // Women's Saloon section
                              buildSection(
                                context,
                                'Womens Saloon',
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: ladies.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return buildHorizontalCard(
                                      height,
                                      width,
                                      ladies[index],
                                      ladiesdetail[index],
                                    );
                                  },
                                ),
                              ),

                              Divider(thickness: 5, color: AppColors.lightGrey),
                              // Maintenance section
                              buildSection(
                                context,
                                'Maintenance',
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: maintain.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return buildHorizontalCard(
                                      height,
                                      width,
                                      maintain[index],
                                      maintaindetail[index],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }

  // Reusable method for building sections
  Widget buildSection(BuildContext context, String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        SizedBox(height: 150, child: content),
      ],
    );
  }

  // Reusable method for building horizontal cards
  Widget buildHorizontalCard(
      double height, double width, String image, String detail) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Container(
            height: height * .14,
            width: width * 0.43,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            detail,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
