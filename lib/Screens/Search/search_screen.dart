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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFormField(
              controller: _mySearchController.searchController,
              hintText: 'Look for services',
              bordercolor: AppColors.black,
              prefixIcon: Icons.search,
              onChanged: (val) {
                _mySearchController.search(val);
                setState(() {});
              },
            ),
            const SizedBox(height: 20),
            _mySearchController.searchResults != null
                ? Expanded(
                    child: ListView.builder(
                      itemCount:
                          _mySearchController.searchResults!.categories!.length,
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
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
