import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'data.dart';

class ImageListView extends StatefulWidget {
  const ImageListView({super.key, required this.startIndex});

  final int startIndex;

  @override
  State<ImageListView> createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(
      () {
        // implement scroll of list
        if (_scrollController.position.atEdge) {
          _autoScroll();
        }

        // adding to list
        WidgetsBinding.instance.addPostFrameCallback(
          (_) {
            _autoScroll();
          },
        );
      },
    );
    super.initState();
  }

  void _autoScroll() {
    final double currentScrollPosition = _scrollController.offset;
    final double endScrollPosition = _scrollController.position.maxScrollExtent;

    scheduleMicrotask(
      () {
        _scrollController.animateTo(
            currentScrollPosition == endScrollPosition ? 0 : endScrollPosition,
            duration: const Duration(seconds: 10),
            curve: Curves.linear);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 1.96 * pi,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .6,
        height: MediaQuery.of(context).size.height * .6,
        child: ListView.builder(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          itemCount: products.length - 2,
          itemBuilder: (context, index) {
            return CachedNetworkImage(
              imageUrl: products[widget.startIndex + index].productImageUrl,
              // fit: BoxFit.cover,
              imageBuilder: (context, imageProvider) => Container(
                margin: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  top: 10.0,
                ),
                height: MediaQuery.of(context).size.height * .4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}