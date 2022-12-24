// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridViewPicks extends StatelessWidget {
  final _gridViewPicks = [
    {
      'image': 'assets/images/pizza_pic.png',
      'title': 'Cipolla',
      'description': 'Pizza description',
      'price': 10.0,
    },
    {
      'image': 'assets/images/pizza_pic.png',
      'title': 'Four Season',
      'description': 'Pizza description',
      'price': 10.0,
    },
    {
      'image': 'assets/images/salad.png',
      'title': 'Salad',
      'description': 'Pizza description',
      'price': 10.0,
    },
    {
      'image': 'assets/images/salad.png',
      'title': 'Salad',
      'description': 'Pizza description',
      'price': 10.0,
    },
    {
      'image': 'assets/images/salad.png',
      'title': 'Salad',
      'description': 'Pizza description',
      'price': 10.0,
    },
    {
      'image': 'assets/images/salad.png',
      'title': 'Salad',
      'description': 'Pizza description',
      'price': 10.0,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _gridViewPicks.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        return Container(
          height: 212,
          width: 174,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(104, 104, 104, 0.7),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(height: 100, '${_gridViewPicks[index]['image']}'),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Icon(
                      size: 30,
                      Icons.favorite_rounded,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${_gridViewPicks[index]['title']}',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '${_gridViewPicks[index]['description']}',
                      style: GoogleFonts.poppins(
                        textStyle: Theme.of(context).textTheme.labelSmall,
                        fontSize: 11,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          '\$${_gridViewPicks[index]['price']}',
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
        );
      },
    );
  }
}
