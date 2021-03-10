import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(1.0),
      height: 130.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Category(
            image_location: 'images/SweetsIcon.png',
            image_caption: 'Sweets',
          ),
          Category(
            image_location: 'images/FruitIcon.jpg',
            image_caption: 'Fruits',
          ),
          Category(
            image_location: 'images/DrinksIcon.jpg',
            image_caption: 'Drinks',
          ),
          Category(
            image_location: 'images/CleanToolsIcon.png',
            image_caption: 'Cleaners',
          ),
          Category(
            image_location: 'images/FoodIcon.png',
            image_caption: 'Food',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;
  Category({
    this.image_location,
    this.image_caption,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/show_category',
            arguments: image_caption,
          );
        },
        child: Container(
          color: Colors.white,
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              image_location,
              width: 50.0,
              height: 50.0,
            ),
            subtitle: Center(
                child: Text(
              image_caption,
              style: TextStyle(
                fontSize: 15,
              ),
            )),
          ),
        ),
      ),
    );
  }
}
