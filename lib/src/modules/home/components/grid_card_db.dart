import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../configs/size_config.dart';
import '../../added_item/models/category.dart';

class TopPicksGrid extends StatelessWidget {
  const TopPicksGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('catagory').snapshots(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text('Error'),
          );
        }
        List<Category> categories = [];
        for (var doc in snapshot.data!.docs) {
          categories.add(Category.fromDocument(doc));
        }
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            return InkWell(
              child: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(104, 104, 104, 0.7),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: mainMin,
                children: [
                  Expanded(
                    child: CachedNetworkImage(
                      imageUrl: categories[index].imageUrl,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                    ),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(12.0, 12.0, 0, 12.0),
                      child: Icon(
                        size: 30,
                        Icons.favorite_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.fromLTRB(14.0, 0, 14.0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      categories[index].itemName,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      categories[index].description,
                      style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.labelSmall,
                        fontSize: 11,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '\$${categories[index].price.toString()}',
                          style: GoogleFonts.poppins(
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFE31640),
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.add_circle,
                          color: Color(0xFFE31640),
                          size: 30,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
            );
          },
        );
      }),
    );
  }
}
