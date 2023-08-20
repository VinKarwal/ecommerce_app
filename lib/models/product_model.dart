import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        category,
        imageUrl,
        price,
        isRecommended,
        isPopular,
      ];

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      category: json['category'],
      imageUrl: json['imageUrl'],
      price: json['price'],
      isRecommended: json['isRecommended'],
      isPopular: json['isPopular'],
    );
  }
  // static List<Product> products = [
  //   const Product(
  //     name: 'Apples',
  //     category: 'Fruits & Vegetables',
  //     imageUrl:
  //         'https://media.istockphoto.com/id/622795204/photo/red-delicious-apples.jpg?s=612x612&w=0&k=20&c=-uu4u0m62t1nz3kcOVkallOgSWoOj_KtcVTCIlyfpXY=',
  //     price: 4.99,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Bananas',
  //     category: 'Fruits & Vegetables',
  //     imageUrl:
  //         'https://images.everydayhealth.com/images/diet-nutrition/all-about-bananas-nutrition-facts-health-benefits-recipes-and-more-rm-722x406.jpg',
  //     price: 4.99,
  //     isRecommended: false,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Oranges',
  //     category: 'Fruits & Vegetables',
  //     imageUrl:
  //         'https://cdn-prod.medicalnewstoday.com/content/images/articles/272/272782/oranges-in-a-box.jpg',
  //     price: 4.99,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Grapes',
  //     category: 'Fruits & Vegetables',
  //     imageUrl:
  //         'https://www.foodrepublic.com/img/gallery/15-types-of-grapes-to-know-eat-and-drink/l-intro-1684769284.jpg',
  //     price: 4.99,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Strawberries',
  //     category: 'Fruits & Vegetables',
  //     imageUrl:
  //         'https://clv.h-cdn.co/assets/15/22/2560x1728/gallery-1432664914-strawberry-facts1.jpg',
  //     price: 4.99,
  //     isRecommended: false,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Broccoli',
  //     category: 'Fruits & Vegetables',
  //     imageUrl:
  //         'https://www.acouplecooks.com/wp-content/uploads/2022/07/How-to-Blanch-Broccoli-003.jpg',
  //     price: 4.99,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Spinach',
  //     category: 'Fruits & Vegetables',
  //     imageUrl:
  //         'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2021/11/nutritional_spinach_GettyImages585833313_Thumb-732x549.jpg',
  //     price: 4.99,
  //     isRecommended: false,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Tomatoes',
  //     category: 'Fruits & Vegetables',
  //     imageUrl:
  //         'https://i0.wp.com/www.eastmojo.com/wp-content/uploads/2022/11/tomatoes.jpg?fit=2121%2C1414&ssl=1',
  //     price: 4.99,
  //     isRecommended: false,
  //     isPopular: true,
  //   ),
  //   const Product(
  //     name: 'Bell peppers',
  //     category: 'Fruits & Vegetables',
  //     imageUrl:
  //         'https://www.chilipeppermadness.com/wp-content/uploads/2019/08/Bell-Peppers.jpg',
  //     price: 4.99,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Cucumbers',
  //     category: 'Fruits & Vegetables',
  //     imageUrl:
  //         'https://www.finedininglovers.com/sites/g/files/xknfdk626/files/styles/open_graph_image/public/2022-06/Type%20of%20cucumber.jpg?itok=qPrkefos',
  //     price: 4.99,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Chicken breast',
  //     category: 'Meat',
  //     imageUrl:
  //         'https://dao54xqhg9jfa.cloudfront.net/OMS-ProductMerchantdising/309fd63d-1554-cdfb-f41a-7089ee2039b1/original/PDP_2._Chicken_Breast_470_X_320_PDP.jpg',
  //     price: 4.99,
  //     isRecommended: false,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Ground beef',
  //     category: 'Meat',
  //     imageUrl:
  //         'https://embed.widencdn.net/img/beef/4hh1pywcnj/800x600px/Grind_Fine_85.psd?keep=c&u=7fueml',
  //     price: 4.99,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Pork chops',
  //     category: 'Meat',
  //     imageUrl:
  //         'https://hips.hearstapps.com/del.h-cdn.co/assets/18/11/1600x1200/sd-aspect-1520972774-pork-chops-horizontal.jpg?resize=1200:*',
  //     price: 4.99,
  //     isRecommended: false,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Lamb leg',
  //     category: 'Meat',
  //     imageUrl:
  //         'https://assets.epicurious.com/photos/58d2960d0008d94d75fb8600/4:3/w_1159,h_869,c_limit/Leg-of-Lamb-With-Garlic-and-Rosemary-22032017.jpg',
  //     price: 4.99,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Turkey',
  //     category: 'Meat',
  //     imageUrl:
  //         'https://4.imimg.com/data4/VT/DX/GLADMIN-186057/turkey-meat-500x500.jpg',
  //     price: 4.99,
  //     isRecommended: false,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Bacon',
  //     category: 'Meat',
  //     imageUrl:
  //         'https://thekitchencommunity.org/wp-content/uploads/2021/04/Can-You-Freeze-Uncooked-Bacon-1200x800.jpg',
  //     price: 4.99,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Sausages',
  //     category: 'Meat',
  //     imageUrl:
  //         'https://media.istockphoto.com/id/509273691/photo/sausages-pork-with-rosemary.jpg?s=612x612&w=0&k=20&c=LD1_97YLOHojAo-Ih2ZZQLuGF9MHq4UtteZUFlfRlOo=',
  //     price: 4.99,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Duck breast',
  //     category: 'Meat',
  //     imageUrl:
  //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQYsXzGWH4mgYpPTlmGVDiwD5ije8PntrWaKn_sTPmPGw&s',
  //     price: 4.99,
  //     isRecommended: false,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Veal cutlets',
  //     category: 'Meat',
  //     imageUrl:
  //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7d2XPHdXQ_RnqsvS4bgPS8KIZtYZ8hHHT5z4XSobZDQ&s',
  //     price: 4.99,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Ribeye steak',
  //     category: 'Meat',
  //     imageUrl:
  //         'https://i.pinimg.com/originals/c2/59/cf/c259cfeae44281b619cd00a36e9f3dcf.jpg',
  //     price: 4.99,
  //     isRecommended: false,
  //     isPopular: true,
  //   ),
  //   const Product(
  //     name: 'Cinnamon',
  //     category: 'Spices',
  //     imageUrl:
  //         'https://images-prod.healthline.com/hlcmsresource/images/AN_images/health-benefits-cinnamon-1296x728.jpg',
  //     price: 4.99,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Black pepper',
  //     category: 'Spices',
  //     imageUrl:
  //         'https://www.sattvasugandha.com/wp-content/uploads/2021/02/Black-Pepper-Slides-V3_2-1.jpg',
  //     price: 4.99,
  //     isRecommended: false,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Paprika',
  //     category: 'Spices',
  //     imageUrl:
  //         'https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/paprika-benefits-1296x728-feature.jpg?w=1155&h=1528',
  //     price: 4.99,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Cumin',
  //     category: 'Spices',
  //     imageUrl:
  //         'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/319562_2200-732x549.jpg',
  //     price: 4.99,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Turmeric',
  //     category: 'Spices',
  //     imageUrl:
  //         'https://cdn-prod.medicalnewstoday.com/content/images/articles/318/318405/turmeric-root-and-powder.jpg',
  //     price: 4.99,
  //     isRecommended: false,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Ginger',
  //     category: 'Spices',
  //     imageUrl:
  //         'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/320546_2200-732x549.jpg',
  //     price: 4.99,
  //     isRecommended: false,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Cloves',
  //     category: 'Spices',
  //     imageUrl:
  //         'https://resize.indiatvnews.com/en/resize/newbucket/1200_-/2021/04/cloves-warm-water-1617732352.jpg',
  //     price: 4.99,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Nutmeg',
  //     category: 'Spices',
  //     imageUrl:
  //         'https://www.tastingtable.com/img/gallery/most-of-the-worlds-nutmeg-comes-from-this-country/l-intro-1666725215.jpg',
  //     price: 4.99,
  //     isRecommended: false,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Chili powder',
  //     category: 'Spices',
  //     imageUrl:
  //         'https://rawleafstory.com/cdn/shop/products/kashmiri-chilli-powder-10-500x500.jpg?v=1630303814',
  //     price: 4.99,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Coriander',
  //     category: 'Spices',
  //     imageUrl:
  //         'https://i0.wp.com/post.healthline.com/wp-content/uploads/2019/09/coriander-cilantro-seeds-herb-1296x728-header-1296x728.jpg?w=1155&h=1528',
  //     price: 4.99,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Water',
  //     category: 'Beverages',
  //     imageUrl:
  //         'https://www.bigbasket.com/media/uploads/p/l/265894-2_1-aquafina-packaged-drinking-water.jpg',
  //     price: 4.99,
  //     isRecommended: false,
  //     isPopular: true,
  //   ),
  //   const Product(
  //     name: 'Coffee',
  //     category: 'Beverages',
  //     imageUrl:
  //         'https://images.unsplash.com/photo-1538587888044-79f13ddd7e49?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y29mZWV8ZW58MHx8MHx8fDA%3D&w=1000&q=80',
  //     price: 4.99,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Tea',
  //     category: 'Beverages',
  //     imageUrl:
  //         'https://www.indianhealthyrecipes.com/wp-content/uploads/2023/05/indian-masala-chai-tea.jpg.webp',
  //     price: 4.99,
  //     isRecommended: false,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Orange juice',
  //     category: 'Beverages',
  //     imageUrl:
  //         'https://www.alphafoodie.com/wp-content/uploads/2020/11/Orange-Juice-1-of-1.jpeg',
  //     price: 4.99,
  //     isRecommended: false,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Apple juice',
  //     category: 'Beverages',
  //     imageUrl:
  //         'https://www.indianhealthyrecipes.com/wp-content/uploads/2022/02/apple-juice-recipe.jpg',
  //     price: 4.99,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Soda',
  //     category: 'Beverages',
  //     imageUrl:
  //         'https://5.imimg.com/data5/BW/OR/PU/SELLER-49520187/thums-up-cold-drink.jpg',
  //     price: 4.99,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Milk',
  //     category: 'Beverages',
  //     imageUrl:
  //         'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaRzE-K9X7ut8jXngnXRePGywMKvAZ7YnUbQWhd7fSJVEfvwPbSYNGIj1nvqbMq1GwI_4&usqp=CAU',
  //     price: 4.99,
  //     isRecommended: false,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Lemonade',
  //     category: 'Beverages',
  //     imageUrl:
  //         'https://hips.hearstapps.com/hmg-prod/images/lemonade-index-647dfeb4413b4.jpg?crop=0.8890270223603557xw:1xh;center,top&resize=1200:*',
  //     price: 4.99,
  //     isRecommended: false,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Iced tea',
  //     category: 'Beverages',
  //     imageUrl:
  //         'https://www.allrecipes.com/thmb/REETjYFdVRmMtwVHPT66VmQVmmI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/109190-smooth-sweet-tea-DDMFS-4x3-9e849a386d414cb2b852099f02b6782d.jpg',
  //     price: 4.99,
  //     isRecommended: true,
  //     isPopular: false,
  //   ),
  //   const Product(
  //     name: 'Energy drinks',
  //     category: 'Beverages',
  //     imageUrl: 'https://boozy.ph/cdn/shop/products/RedBull.png?v=1601541174',
  //     price: 4.99,
  //     isRecommended: false,
  //     isPopular: false,
  //   ),
  // ];
}
