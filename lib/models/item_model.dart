

class Item {
  String imageUrl;
  String name;
  double price;
  double discountPrice;
  double discount;
  int reviews;

  Item({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.discountPrice,
    required this.discount,
    required this.reviews,
  });

  static List<Item> itemList=[
    Item(imageUrl: 'https://picsum.photos/250?image=2', name: "AKG N5005 Reference Class 5-driver Configuration In-Ear Headphones", price: 290, discountPrice: 145, discount: 50, reviews: 10),
    Item(imageUrl: 'https://picsum.photos/250?image=3', name: "Apple Watch Series 3 38mm 42mm GPS+ WIFI + LTE UNLOCKED Gold Gray Silver - Good", price: 199.99, discountPrice: 94.99, discount: 53, reviews: 10),
    Item(imageUrl: 'https://picsum.photos/250?image=4', name: "AKG N5005 Reference Class 5-driver Configuration In-Ear Headphones", price: 290, discountPrice: 145, discount: 50, reviews: 10),
    Item(imageUrl: 'https://picsum.photos/250?image=5', name: "Apple Watch Series 3 38mm 42mm GPS+ WIFI + LTE UNLOCKED Gold Gray Silver - Good", price: 199.99, discountPrice: 94.99, discount: 53, reviews: 10),
    Item(imageUrl: 'https://picsum.photos/250?image=6', name: "AKG N5005 Reference Class 5-driver Configuration In-Ear Headphones", price: 290, discountPrice: 145, discount: 50, reviews: 10)
  ];
  static List<Item> JustForUList=[
    Item(imageUrl: 'https://picsum.photos/250?image=2', name: "AKG N5005 Reference Class 5-driver Configuration In-Ear Headphones", price: 290, discountPrice: 145, discount: 50, reviews: 10),
    Item(imageUrl: 'https://picsum.photos/250?image=3', name: "Apple Watch Series 3 38mm 42mm GPS+ WIFI + LTE UNLOCKED Gold Gray Silver - Good", price: 199.99, discountPrice: 94.99, discount: 53, reviews: 10),
    Item(imageUrl: 'https://picsum.photos/250?image=4', name: "AKG N5005 Reference Class 5-driver Configuration In-Ear Headphones", price: 290, discountPrice: 145, discount: 50, reviews: 10),
    Item(imageUrl: 'https://picsum.photos/250?image=5', name: "Apple Watch Series 3 38mm 42mm GPS+ WIFI + LTE UNLOCKED Gold Gray Silver - Good", price: 199.99, discountPrice: 94.99, discount: 53, reviews: 10),
    Item(imageUrl: 'https://picsum.photos/250?image=6', name: "AKG N5005 Reference Class 5-driver Configuration In-Ear Headphones", price: 290, discountPrice: 145, discount: 50, reviews: 10),
     Item(imageUrl: 'https://picsum.photos/250?image=7', name: "AKG N5005 Reference Class 5-driver Configuration In-Ear Headphones", price: 290, discountPrice: 145, discount: 50, reviews: 10),
    Item(imageUrl: 'https://picsum.photos/250?image=8', name: "Apple Watch Series 3 38mm 42mm GPS+ WIFI + LTE UNLOCKED Gold Gray Silver - Good", price: 199.99, discountPrice: 94.99, discount: 53, reviews: 10),
    Item(imageUrl: 'https://picsum.photos/250?image=9', name: "AKG N5005 Reference Class 5-driver Configuration In-Ear Headphones", price: 290, discountPrice: 145, discount: 50, reviews: 10),
    Item(imageUrl: 'https://picsum.photos/250?image=10', name: "Apple Watch Series 3 38mm 42mm GPS+ WIFI + LTE UNLOCKED Gold Gray Silver - Good", price: 199.99, discountPrice: 94.99, discount: 53, reviews: 10),
    Item(imageUrl: 'https://picsum.photos/250?image=1', name: "AKG N5005 Reference Class 5-driver Configuration In-Ear Headphones", price: 290, discountPrice: 145, discount: 50, reviews: 10)
  ];
}