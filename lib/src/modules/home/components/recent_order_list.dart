import 'package:elven_food_app/src/configs/size_config.dart';
import 'package:flutter/material.dart';

class RecentOrder extends StatelessWidget {
  const RecentOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> catagories = [
      {
        "image": "assets/images/pizza_pic.png",
        "title": "Pizza",
        "amount": 2,
        "currency": 10.0,
      },
      {
        "image": "assets/images/pizza_pic.png",
        "title": "Pizza",
        "amount": 2,
        "currency": 10.0,
      },
      {
        "image": "assets/images/pizza_pic.png",
        "title": "Pizza",
        "amount": 2,
        "currency": 10.0,
      },
      {
        "image": "assets/images/pizza_pic.png",
        "title": "Pizza",
        "amount": 2,
        "currency": 10.0,
      },
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            catagories.length,
            (index) => OrderCategoryCard(
              image: catagories[index]["image"],
              title: catagories[index]["title"],
              amount: catagories[index]["amount"],
              currency: catagories[index]["currency"],
              press: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class OrderCategoryCard extends StatelessWidget {
  const OrderCategoryCard({
    Key? key,
    required this.image,
    required this.title,
    required this.press,
    required this.amount,
    required this.currency,
  }) : super(key: key);

  final String image, title;
  final int amount;
  final double currency;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 174,
        height: 82,
        child: Card(
          color: const Color.fromRGBO(104, 104, 104, 0.7),
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Row(
            crossAxisAlignment: crossStart,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  height: 82,
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "X$amount",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "\$$currency",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFE31640),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
