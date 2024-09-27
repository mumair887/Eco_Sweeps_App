import 'package:flutter/material.dart';
import 'package:service_app/Constants/app_colors.dart';
import 'package:service_app/Widgets/custom_textformfield.dart';

import '../../Controller/search_controller.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final MySearchController _mySearchController = MySearchController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(70, 70),
        child: AppBar(
          title: const Text('Search'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextFormField(
                controller: _mySearchController.searchController,
                hintText: 'Look for services',
                bordercolor: AppColors.black,
                prefixIcon: Icons.search,
                isAutoFocus: true,
                onChanged: (val) {
                  _mySearchController.search(val);
                  setState(() {});
                },
              ),
              const SizedBox(height: 20),
              _mySearchController.searchResults != null
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Categories",
                              style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _mySearchController
                              .searchResults!.categories!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Container(
                                height: 40,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          _mySearchController.searchResults!
                                              .categories![index].image
                                              .toString(),
                                        ),
                                        fit: BoxFit.fill)),
                              ),
                              title: Text(
                                _mySearchController
                                    .searchResults!.categories![index].name
                                    .toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                              onTap: () {},
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, bottom: 10, top: 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Sub-Categories",
                              style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _mySearchController
                              .searchResults!.subcategories!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Container(
                                height: 40,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          _mySearchController.searchResults!
                                              .subcategories![index].image
                                              .toString(),
                                        ),
                                        fit: BoxFit.fill)),
                              ),
                              title: Text(
                                _mySearchController
                                    .searchResults!.subcategories![index].name
                                    .toString(),
                                style: const TextStyle(color: Colors.black),
                              ),
                              onTap: () {},
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, bottom: 10, top: 10),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Products",
                              style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _mySearchController
                              .searchResults!.products!.length,
                          itemBuilder: (context, index) {
                            return _mySearchController
                                            .searchResults!.products ==
                                        null ||
                                    _mySearchController
                                        .searchResults!.products!.isEmpty
                                ? Text(
                                    "No match product found",
                                    style: TextStyle(color: AppColors.grey),
                                  )
                                : ListTile(
                                    leading: Container(
                                      height: 40,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                _mySearchController
                                                    .searchResults!
                                                    .products![index]
                                                    .image
                                                    .toString(),
                                              ),
                                              fit: BoxFit.fill)),
                                    ),
                                    title: Text(
                                      _mySearchController
                                          .searchResults!.products![index].name
                                          .toString(),
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                    onTap: () {},
                                  );
                          },
                        ),
                      ],
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
