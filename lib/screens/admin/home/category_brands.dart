
import 'package:appmobile/screens/user/screen/boutiqueprofile.dart';
import 'package:flutter/material.dart';

import '../../../module/client.dart';
import '../../components/loader.dart';
import '../product/service_category/service_category.dart';

class BrandsPagecategory extends StatefulWidget {
  static const String routeName = '/cat';
  final String category;

  const BrandsPagecategory({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  State<BrandsPagecategory> createState() => _BrandsPagecategory();
}

class _BrandsPagecategory extends State<BrandsPagecategory> {
  List<Client>? boutiqueList;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchCategorybrands();
  }

  fetchCategorybrands() async {
    boutiqueList = await homeServices.fetchCategorybrands(
      context: context,
      category: widget.category,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          centerTitle: true,
          title: Column(
            children: [
              Text(
                widget.category,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          leading: IconButton(
            icon: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black.withOpacity(0.2)),
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 15,
                  color: Colors.black,
                ),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      body: boutiqueList == null
          ? const Loader()
          : Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  alignment: Alignment.topLeft,
                
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: boutiqueList!.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      final product = boutiqueList![index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            profileboutique.routeName,
                            arguments: product,
                          );
                        },
                        child: Column(
                          children: [
                            Expanded(
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                    width: 0.5,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.network(
                                    product.images[0],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.only(
                                left: 0,
                                top: 5,
                              ),
                              child: Text(
                                product.nameboutique,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.only(
                                left: 0,
                                top: 5,
                              ),
                              child: Text(
                                product.bio,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xffbf0772),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}