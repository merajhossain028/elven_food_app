import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elven_food_app/src/modules/item_description/view/item_description.dart';
import 'package:elven_food_app/src/utils/routes/custom_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../configs/size_config.dart';
import '../../added_item/models/category.dart';
import '../provider/catagory_provider.dart';

class TopPicksGrid extends ConsumerWidget {
  const TopPicksGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        List<Category> rawCat = [];
        List<Category> categories = [];
        for (var doc in snapshot.data!.docs) {
          rawCat.add(Category.fromDocument(doc));
        }
        final cat = ref.watch(catagorypd);

        categories = cat == 'all'
            ? rawCat
            : rawCat
                .where((e) => e.catagoryName.toLowerCase() == cat.toLowerCase())
                .toList();
        return categories.isEmpty
            ? Center(
                child: Container(
                  height: 500,
                  width: 500,
                  color: Colors.pink,
                  child: const Center(
                    child: Text(
                      'No Catagory Found',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              )
            : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        SlideLeftRoute(
                          page: ItemDescription(
                            category: categories[index],
                          ),
                        ),
                      );
                    },
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
                                  errorWidget: (context, url, error) =>
                                      const Center(child: Icon(Icons.error)),
                                ),
                              ),
                              const Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(12.0, 12.0, 0, 12.0),
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
                            padding:
                                const EdgeInsets.fromLTRB(14.0, 0, 14.0, 0),
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
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.poppins(
                                    textStyle:
                                        Theme.of(context).textTheme.labelSmall,
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
