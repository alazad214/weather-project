import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/colors.dart';

class DetailsScreen extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>>? data;

  const DetailsScreen({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constaints) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.denim_,
          titleSpacing: 0,
          title: Text(
            data!["title"],
            style: const TextStyle(color: Colors.amber, fontSize: 20),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    height: 170,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    imageUrl: data!["image"],
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text(data!["dis"])),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
} /**/
