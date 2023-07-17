
import 'package:appmobile/screens/admin/product/service_details/details.dart';
import 'package:appmobile/screens/admin/product/service_product/service-product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../module/comments.dart';
import '../../../providers/provider.dart';
class comments extends StatefulWidget {
  static const String routeName = '/comment';

  const comments({Key? key}) : super(key: key);

  @override
  State<comments> createState() => _CommentsState();
}

class _CommentsState extends State<comments> {
  List<Comment>? comments;
  final AdminServices adminServices = AdminServices();
  final ProductDetailsServices productDetailsServices =
      ProductDetailsServices();

  @override
  void initState() {
    super.initState();
    fetchAllComments();
  }

  fetchAllComments() async {
    comments = await productDetailsServices.fetchAllComment(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
      ),
      body: comments != null
          ? ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              itemCount: comments!.length,
              itemBuilder: (context, index) {
                final comment = comments![index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "${Provider.of<UserProvider>(context).user.name}",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Text(
                            '${comment.text}',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '${comment.createdAt}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
