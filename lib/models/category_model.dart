import 'package:equatable/equatable.dart';

class Category1 extends Equatable {
  final String name;
  final String imageUrl;

  const Category1({required this.name, required this.imageUrl});

  @override
  // TODO: implement props
  List<Object?> get props => [name, imageUrl];

  static List<Category1> categories = [
    Category1(
        name: "Fruits & Vegetables",
        imageUrl:
            "https://www.lalpathlabs.com/blog/wp-content/uploads/2019/01/Fruits-and-Vegetables.jpg"),
    Category1(
        name: "Spices",
        imageUrl:
            "https://media.istockphoto.com/id/941858854/photo/herbs-and-spices-for-cooking-on-dark-background.jpg?s=612x612&w=0&k=20&c=-quRLbD1Hkd2-i_I-uqJltiA516alqGNojlobB6nZ7A="),
    Category1(
        name: "Meat",
        imageUrl:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/FoodMeat.jpg/800px-FoodMeat.jpg"),
    Category1(
        name: "Beverages",
        imageUrl:
            "https://www.foodismust.in/wp-content/uploads/2023/04/Popular-Drinks-in-Tamil-Nadu-A-Guide-to-Refreshing-Beverages.jpg"),
  ];
}
