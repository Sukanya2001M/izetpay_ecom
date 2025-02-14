import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Chatscreen.dart';
import 'constants/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  List<Map<String, dynamic>> categories = [
    {'name': 'Electronics', 'image': 'assets/ps2.png'},
    {'name': 'Furniture', 'image': 'assets/chair2.png'},
    {'name': 'Chips', 'image': 'assets/lays11.png'},
    {'name': 'Pringles', 'image': 'assets/pringles4.png'},
    {'name': 'Dress', 'image': 'assets/dress1.png'},
    {'name': 'Fruits', 'image': 'assets/converted_image-1.png'},
    {'name': 'Vegtable', 'image': 'assets/veg.png'},
    {'name': 'Groceries', 'image': 'assets/gro.png'},
  ];

  List<Map<String, dynamic>> products = [
    {
      'category': 'Electronics',
      'name': 'Laptop',
      'price': 299,
      'old_price': 400,
      'quantity': 10,
      'image': 'assets/tab.png'
    },
    {
      'category': 'Electronics',
      'name': 'Laptop',
      'price': 899,
      'old_price': 1000,
      'quantity': 5,
      'image': 'assets/tab2.png'
    },
    {
      'category': 'Electronics',
      'name': 'Smart Phone',
      'price': 899,
      'old_price': 1000,
      'quantity': 5,
      'image': 'assets/printer.png'
    },
    {
      'category': 'Electronics',
      'name': 'Laptop',
      'price': 899,
      'old_price': 1000,
      'quantity': 5,
      'image': 'assets/printer1.png'
    },
    {
      'category': 'Electronics',
      'name': 'Device',
      'price': 899,
      'old_price': 1000,
      'quantity': 5,
      'image': 'assets/device.png'
    },
    {
      'category': 'Electronics',
      'name': 'Camera',
      'price': 899,
      'old_price': 13700,
      'quantity': 5,
      'image': 'assets/playstation.png'
    },
    {
      'category': 'Electronics',
      'name': 'PS2',
      'price': 399,
      'old_price': 1000,
      'quantity': 2,
      'image': 'assets/ps2.png'
    },
    {
      'category': 'Electronics',
      'name': 'PS2',
      'price': 399,
      'old_price': 1000,
      'quantity': 2,
      'image': 'assets/joy.png'
    },
    {
      'category': 'Furniture',
      'name': 'Table',
      'price': 399,
      'old_price': 1000,
      'quantity': 2,
      'image': 'assets/furn.png'
    },
    {
      'category': 'Furniture',
      'name': 'Table',
      'price': 79,
      'old_price': 200,
      'quantity': 8,
      'image': 'assets/chair.png'
    },
    {
      'category': 'Furniture',
      'name': 'Table',
      'price': 79,
      'old_price': 200,
      'quantity': 8,
      'image': 'assets/chair1.png'
    },
    {
      'category': 'Furniture',
      'name': 'Bed',
      'price': 79,
      'old_price': 200,
      'quantity': 8,
      'image': 'assets/chair2.png'
    },
    {
      'category': 'Furniture',
      'name': 'Chair',
      'price': 79,
      'old_price': 200,
      'quantity': 8,
      'image': 'assets/chair3.png'
    },
    {
      'category': 'Furniture',
      'name': 'Royal Chair',
      'price': 79,
      'old_price': 200,
      'quantity': 8,
      'image': 'assets/chair4.png'
    },
    {
      'category': 'Furniture',
      'name': 'Asthetic Sofa',
      'price': 79,
      'old_price': 200,
      'quantity': 8,
      'image': 'assets/set.png'
    },
    {
      'category': 'Furniture',
      'name': 'Dining Table',
      'price': 79,
      'old_price': 200,
      'quantity': 8,
      'image': 'assets/chair5.png'
    },
    {
      'category': 'Chips',
      'name': 'Wavy',
      'price': 14,
      'old_price': 100,
      'quantity': 50,
      'image': 'assets/lays2.png'
    },
    {
      'category': 'Chips',
      'name': 'Sour Cream',
      'price': 5,
      'old_price': 10,
      'quantity': 30,
      'image': 'assets/lays3.png'
    },
    {
      'category': 'Chips',
      'name': 'Salt',
      'price': 56,
      'old_price': 10,
      'quantity': 30,
      'image': 'assets/lays4.png'
    },
    {
      'category': 'Chips',
      'name': 'Dorito Party',
      'price': 54,
      'old_price': 10,
      'quantity': 30,
      'image': 'assets/lays5.png'
    },
    {
      'category': 'Chips',
      'name': 'Dorito Nacho',
      'price': 40,
      'old_price': 100,
      'quantity': 30,
      'image': 'assets/lays6.png'
    },
    {
      'category': 'Chips',
      'name': 'Cheetos Party',
      'price': 20,
      'old_price': 40,
      'quantity': 30,
      'image': 'assets/lays7.png'
    },
    {
      'category': 'Chips',
      'name': 'Dorito Saleno',
      'price': 50,
      'old_price': 100,
      'quantity': 30,
      'image': 'assets/lays8.png'
    },
    {
      'category': 'Chips',
      'name': 'Cheetos Bones',
      'price': 59,
      'old_price': 100,
      'quantity': 30,
      'image': 'assets/lays9.png'
    },
    {
      'category': 'Chips',
      'name': 'Lays BLT',
      'price': 20,
      'old_price': 40,
      'quantity': 30,
      'image': 'assets/lays10.png'
    },
    {
      'category': 'Pringles',
      'name': 'Paprika',
      'price': 20,
      'old_price': 40,
      'quantity': 30,
      'image': 'assets/pringles3.png'
    },
    {
      'category': 'Pringles',
      'name': 'Cheese & Onion',
      'price': 26,
      'old_price': 40,
      'quantity': 30,
      'image': 'assets/pringles4.png'
    },
    {
      'category': 'Pringles',
      'name': 'Cheese & Onion',
      'price': 26,
      'old_price': 40,
      'quantity': 30,
      'image': 'assets/pringles5.png'
    },
    {
      'category': 'Pringles',
      'name': 'Cheese & Onion',
      'price': 26,
      'old_price': 40,
      'quantity': 30,
      'image': 'assets/pringles6.png'
    },
    {
      'category': 'Dress',
      'name': 'Mens T-shirt',
      'price': 5,
      'old_price': 8,
      'quantity': 30,
      'image': 'assets/dress2.png'
    },
    {
      'category': 'Dress',
      'name': 'Mens T-shirt',
      'price': 10,
      'old_price': 30,
      'quantity': 30,
      'image': 'assets/dress3.png'
    },
    {
      'category': 'Dress',
      'name': 'Tops',
      'price': 10,
      'old_price': 30,
      'quantity': 30,
      'image': 'assets/dress4.png'
    },
    {
      'category': 'Dress',
      'name': 'Tops',
      'price': 15,
      'old_price': 30,
      'quantity': 30,
      'image': 'assets/dress5.png'
    },
    {
      'category': 'Fruits',
      'name': 'Orange',
      'price': 40,
      'old_price': 100,
      'quantity': 30,
      'image': 'assets/orange.png'
    },
    {
      'category': 'Fruits',
      'name': 'Water Melon',
      'price': 30,
      'old_price': 40,
      'quantity': 30,
      'image': 'assets/melon.png'
    },
    {
      'category': 'Fruits',
      'name': 'Mango',
      'price': 50,
      'old_price': 100,
      'quantity': 30,
      'image': 'assets/mango.png'
    },
    {
      'category': 'Vegtable',
      'name': 'Carrot',
      'price': 30,
      'old_price': 40,
      'quantity': 30,
      'image': 'assets/carrot.png'
    },
    {
      'category': 'Vegtable',
      'name': 'Tomato',
      'price': 27,
      'old_price': 40,
      'quantity': 30,
      'image': 'assets/tomato.png'
    },
    {
      'category': 'Vegtable',
      'name': 'Brinjal',
      'price': 90,
      'old_price': 200,
      'quantity': 30,
      'image': 'assets/brinjal.png'
    },
    {
      'category': 'Broccoli',
      'name': 'Magazine',
      'price': 90,
      'old_price': 100,
      'quantity': 30,
      'image': 'assets/broccoli.png'
    },
    {
      'category': 'Groceries',
      'name': 'Essential oil',
      'price': 20,
      'old_price': 40,
      'quantity': 30,
      'image': 'assets/oil.png'
    },
    {
      'category': 'Groceries',
      'name': 'Milk',
      'price': 20,
      'old_price': 40,
      'quantity': 30,
      'image': 'assets/milk.png'
    },
    {
      'category': 'Groceries',
      'name': 'Yogurt',
      'price': 20,
      'old_price': 40,
      'quantity': 30,
      'image': 'assets/yougurt.png'
    },
    {
      'category': 'Groceries',
      'name': 'Yogurt Combo',
      'price': 20,
      'old_price': 40,
      'quantity': 30,
      'image': 'assets/yogurt1.png'
    },
    {
      'category': 'Groceries',
      'name': 'Chocolate',
      'price': 20,
      'old_price': 40,
      'quantity': 30,
      'image': 'assets/choco.png'
    },
  ];
  late bool isLoading;
  String selectedCategory = '';

  List<Map<String, dynamic>> getFilteredProducts() {
    if (selectedCategory == null) {
      return products;
    }
    return products
        .where((product) => product['category'] == selectedCategory)
        .toList();
  }

  ScrollController _scrollController = ScrollController();
  final Map<String, double> _categoryOffsets = {};
  late AnimationController _animationController;

  void toggleVisibility() {
    setState(() {
      Constants.isVisible = !Constants.isVisible;
    });
  }

  @override
  void initState() {
    super.initState();
    isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
    // _animationController = AnimationController(
    //   vsync: this,
    //   duration: Duration(seconds: 4),
    // );
    calculateOffsets();
    _scrollController.addListener(() {
      double offset = _scrollController.offset;
      for (var category in categories) {
        String name = category['name'];
        double startOffset = _categoryOffsets[name] ?? 0.0;

        // Calculate end offset dynamically
        int productCount = products
            .where((product) => product['category'] == name)
            .toList()
            .length;
        double endOffset = startOffset + (productCount * 120);

        if (offset >= startOffset && offset < endOffset) {
          setState(() {
            selectedCategory = name;
          });
          break;
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    // _animationController.dispose();
    super.dispose();
  }

  void calculateOffsets() {
    double offset = 0.0;
    for (var category in categories) {
      // number of products in category
      int productCount = products
          .where((product) => product['category'] == category['name'])
          .toList()
          .length;
      _categoryOffsets[category['name']] = offset;
      offset += productCount * 120;
    }
  }

  void scrollToCategory(String categoryName) {
    int categoryIndex =
        categories.indexWhere((category) => category['name'] == categoryName);

    if (categoryIndex != -1) {
      // Scroll to the calculated offset for the selected category
      double targetPosition =
          _categoryOffsets[categories[categoryIndex]['name']] ?? 0.0;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          targetPosition,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    calculateOffsets();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.appBarBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: selectedCategory.isEmpty
            ? Text(
                "E-Commerce",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: Constants.fontFamily,
                  fontSize: 18,
                ),
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selectedCategory,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: Constants.fontFamily,
                    ),
                  ),
                  Text(
                    '${getFilteredProducts().length} Items',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: Constants.fontFamily,
                    ),
                  ),
                ],
              ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.support_agent),
            onPressed: () {
              toggleVisibility();
            },
          ),
        ],
      ),
      body: Constants.isVisible
          ? Container(
              color: Colors.grey,
        child: ChatScreen(),
            )
          : Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Container(
                    color: Constants.background_color,
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                            ),
                            color: Constants.image_con_color,
                          ),
                          padding: EdgeInsets.all(8),
                          child: ListView.builder(
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedCategory =
                                        categories[index]['name'];
                                    products = getFilteredProducts();
                                    calculateOffsets();
                                  });
                                  scrollToCategory(selectedCategory);
                                },
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Stack(
                                      clipBehavior: Clip.none,
                                      // Allow animation to overflow
                                      children: [
                                        Row(
                                          children: [
                                            if (selectedCategory ==
                                                categories[index]['name'])
                                              Container(
                                                width: 3,
                                                height: 60,
                                                decoration: BoxDecoration(
                                                  color: Constants
                                                      .image_con_color1,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10),
                                                  ),
                                                ),
                                              ),
                                            SizedBox(
                                              width: 17,
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Colors.grey[300]!,
                                                ),
                                                color: selectedCategory ==
                                                        categories[index]
                                                            ['name']
                                                    ? Constants.image_con_color1
                                                    : Constants
                                                        .image_con_color2,
                                              ),
                                              height: 60,
                                              width: 50,
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                          bottom: 2,
                                          left: 2,
                                          right: 2,
                                          child: AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.easeOutCubic,
                                            height: selectedCategory ==
                                                    categories[index]['name']
                                                ? 75
                                                : 70,
                                            width: selectedCategory ==
                                                    categories[index]['name']
                                                ? 50
                                                : 50,
                                            child: Stack(
                                              alignment: Alignment.bottomCenter,
                                              clipBehavior: Clip.none,
                                              children: [
                                                Transform.translate(
                                                  offset: selectedCategory ==
                                                          categories[index]
                                                              ['name']
                                                      ? Offset(3,
                                                          -13) // Move up 10 pixels
                                                      : Offset(0, 0),
                                                  child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        selectedCategory =
                                                            categories[index]
                                                                ['name'];
                                                        products =
                                                            getFilteredProducts();
                                                        calculateOffsets();
                                                      });
                                                      WidgetsBinding.instance
                                                          .addPostFrameCallback(
                                                              (_) {
                                                        scrollToCategory(
                                                            selectedCategory);
                                                      });
                                                    },
                                                    child: ClipRRect(
                                                      child: Image.asset(
                                                        categories[index]
                                                            ['image'],
                                                        height: 55,
                                                        width: 50,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 5),
                                    // Category name
                                    Text(
                                      categories[index]['name'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11),
                                    ),
                                    SizedBox(height: 16),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                    ),
                                    color: Constants.container_color,
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: isLoading
                                            ? Container(
                                                height: 10,
                                                width: 50,
                                                color: Colors.grey[100],
                                              )
                                            : Text(
                                                '${getFilteredProducts().length} Items in ${selectedCategory}',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily:
                                                      Constants.fontFamily,
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(3, 0, 0, 0),
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                    decoration: BoxDecoration(
                                      color: Constants.container_color,
                                    ),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: GridView.builder(
                                            controller: _scrollController,
                                            gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing:
                                                  0, // Space between columns
                                              mainAxisSpacing:
                                                  0, // Space between rows
                                              childAspectRatio: 0.5, // height
                                            ),
                                            itemCount: products.length,
                                            itemBuilder: (context, index) {
                                              var product = products[index];
                                              return Container(
                                                padding: EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      spreadRadius: 2,
                                                      blurRadius: 2,
                                                      offset: Offset(5, 0),
                                                    ),
                                                  ],
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    isLoading
                                                        ? Container(
                                                            height: 100,
                                                            width:
                                                                double.infinity,
                                                            color: Colors
                                                                .grey[100],
                                                          )
                                                        : ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            child: Image.asset(
                                                              product['image'],
                                                              height: 100,
                                                              width: double
                                                                  .infinity,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                    SizedBox(height: 3),
                                                    Stack(
                                                      children: [
                                                        Container(
                                                          height: 20,
                                                          width: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            gradient:
                                                                LinearGradient(
                                                              colors: [
                                                                Constants
                                                                    .icon_con_color!,
                                                                Constants
                                                                    .icon_con_color!
                                                                    .withOpacity(
                                                                        0),
                                                              ],
                                                              begin: Alignment
                                                                  .centerLeft,
                                                              end: Alignment
                                                                  .centerRight,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(3.0),
                                                          child: isLoading
                                                              ? Container(
                                                                  height: 13,
                                                                  width: 25,
                                                                  color: Colors
                                                                          .grey[
                                                                      100],
                                                                )
                                                              : Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .bolt,
                                                                      size: 14,
                                                                      color: Constants
                                                                          .icon_color,
                                                                    ),
                                                                    Text(
                                                                      '7 mins',
                                                                      style:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            Constants.fontFamily,
                                                                        fontSize:
                                                                            8,
                                                                        color: Constants
                                                                            .icon_text_color,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 8),
                                                    isLoading
                                                        ? Container(
                                                            height: 15,
                                                            width: 40,
                                                            color: Colors
                                                                .grey[100],
                                                          )
                                                        : Text(
                                                            product['name'],
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  Constants
                                                                      .fontFamily,
                                                            ),
                                                          ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: SizedBox(
                                                        child: Divider(
                                                          height: 1,
                                                          color: Constants
                                                              .divider_color,
                                                        ),
                                                      ),
                                                    ),
                                                    isLoading
                                                        ? Container(
                                                            height: 13,
                                                            width: 13,
                                                            color: Colors
                                                                .grey[100],
                                                          )
                                                        : Text(
                                                            '${product['quantity']} g',
                                                            style: TextStyle(
                                                              fontSize: 10,
                                                              fontFamily:
                                                                  Constants
                                                                      .fontFamily,
                                                            ),
                                                          ),
                                                    isLoading
                                                        ? Container(
                                                            height: 13,
                                                            width: 13,
                                                            color: Colors
                                                                .grey[100],
                                                          )
                                                        : Row(
                                                            children: [
                                                              Text(
                                                                '\u20B9${product['price']}',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 10,
                                                                  fontFamily:
                                                                      Constants
                                                                          .fontFamily,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  width: 5),
                                                              Text(
                                                                '\u20B9${product['old_price']}',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 10,
                                                                  fontFamily:
                                                                      Constants
                                                                          .fontFamily,
                                                                  color: Colors
                                                                      .grey,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                    SizedBox(height: 10),
                                                    SizedBox(
                                                      height: 30,
                                                      width: double.infinity,
                                                      child: ElevatedButton(
                                                        onPressed: () {},
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            side: BorderSide(
                                                              color: Colors.grey
                                                                  .shade100,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          backgroundColor:
                                                              Constants
                                                                  .container_color,
                                                          elevation: 1,
                                                        ),
                                                        child: Text(
                                                          'ADD',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily:
                                                                Constants
                                                                    .fontFamily,
                                                            color: Constants
                                                                .button_text_color,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Stack(
                    children: [
                      Container(
                        width: 900,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, -5),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 60, bottom: 1.5),
                          child: Row(
                            children: [
                              Text(
                                "FREE DELIVERY",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: Constants.fontFamily,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 0.5),
                                child: Text(
                                  "on orders above " + '\u20B9' + "99",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                    fontFamily: Constants.fontFamily,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 9,
                  left: 14,
                  child: Container(
                    width: 40,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.5),
                        width: 5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: Offset(0, -5),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      "assets/scooty.png",
                      height: 1,
                      width: 1,
                    ),
                  ),
                ),
                // AnimatedPositioned(
                //   duration: Duration(milliseconds: 500),
                //   curve: Curves.easeOut,
                //   left: 0,
                //   right: 0,
                //   bottom: Constants.isVisible ? 0 : 0,
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 12),
                //     child: Visibility(
                //       visible: Constants.isVisible,
                //       child: Container(
                //         height: MediaQuery.of(context).viewInsets.bottom > 0 ? 400 : 520,
                //         width: 380,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.only(
                //             topLeft: Radius.circular(28),
                //             topRight: Radius.circular(28),
                //           ),
                //           boxShadow: [
                //             BoxShadow(
                //               color: Colors.black.withOpacity(0.8),
                //               blurRadius: 20,
                //               spreadRadius: 4,
                //             ),
                //           ],
                //           color: Colors.white.withOpacity(0.97),
                //         ),
                //         child: Stack(
                //           children: [
                //             ClipRRect(
                //               borderRadius: BorderRadius.only(
                //                 topLeft: Radius.circular(28),
                //                 topRight: Radius.circular(28),
                //               ),
                //               child: ChatScreen(),
                //             ),
                //             Positioned(
                //               top: 8,
                //               left: 280,
                //               right: 10,
                //               child: GestureDetector(
                //                 onTap: () {
                //                   setState(() {
                //                     Constants.isVisible = false;
                //                   });
                //                 },
                //                 child: Icon(
                //                   Icons.keyboard_arrow_down,
                //                   color: Colors.white,
                //                   size: 30,
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
    );
  }
}
