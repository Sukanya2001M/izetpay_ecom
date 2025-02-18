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
  List<Map<String, dynamic>> getFilteredProducts() {
    if (Constants.selectedCategory == null) {
      return Constants.products;
    }
    return Constants.products
        .where((product) => product['category'] == Constants.selectedCategory)
        .toList();
  }

  void toggleVisibility() {
    setState(() {
      Constants.isVisible = !Constants.isVisible;
    });
  }

  @override
  void initState() {
    super.initState();
    Constants.isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        Constants.isLoading = false;
      });
    });
    // _animationController = AnimationController(
    //   vsync: this,
    //   duration: Duration(seconds: 4),
    // );
    calculateOffsets();
    Constants.scrollController.addListener(() {
      double offset = Constants.scrollController.offset;
      for (var category in Constants.categories) {
        String name = category['name'];
        double startOffset = Constants.categoryOffsets[name] ?? 0.0;

        // Calculate end offset dynamically
        int productCount = Constants.products
            .where((product) => product['category'] == name)
            .toList()
            .length;
        double endOffset = startOffset + (productCount * 120);

        if (offset >= startOffset && offset < endOffset) {
          setState(() {
            Constants.selectedCategory = name;
          });
          break;
        }
      }
    });
  }

  @override
  void dispose() {
    Constants.scrollController.dispose();
    // _animationController.dispose();
    super.dispose();
  }

  void calculateOffsets() {
    double offset = 0.0;
    for (var category in Constants.categories) {
      // number of products in category
      int productCount = Constants.products
          .where((product) => product['category'] == category['name'])
          .toList()
          .length;
      Constants.categoryOffsets[category['name']] = offset;
      offset += productCount * 120;
    }
  }

  void scrollToCategory(String categoryName) {
    int categoryIndex = Constants.categories
        .indexWhere((category) => category['name'] == categoryName);

    if (categoryIndex != -1) {
      // Scroll to the calculated offset for the selected category
      double targetPosition = Constants
              .categoryOffsets[Constants.categories[categoryIndex]['name']] ??
          0.0;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Constants.scrollController.animateTo(
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
        title: Constants.selectedCategory.isEmpty
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
                    Constants.selectedCategory,
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
      // body: Constants.isVisible
      //     ? Container(
      //         color: Colors.grey,
      //         child: ChatScreen(),
      //       )
      //     :
      body: Stack(
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
                      itemCount: Constants.categories.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              Constants.selectedCategory =
                                  Constants.categories[index]['name'];
                              Constants.products = getFilteredProducts();
                              calculateOffsets();
                            });
                            scrollToCategory(Constants.selectedCategory);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                // Allow animation to overflow
                                children: [
                                  Row(
                                    children: [
                                      if (Constants.selectedCategory ==
                                          Constants.categories[index]['name'])
                                        Container(
                                          width: 3,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            color: Constants.image_con_color1,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              bottomRight: Radius.circular(10),
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
                                          color: Constants.selectedCategory ==
                                                  Constants.categories[index]
                                                      ['name']
                                              ? Constants.image_con_color1
                                              : Constants.image_con_color2,
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
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeOutCubic,
                                      height: Constants.selectedCategory ==
                                              Constants.categories[index]
                                                  ['name']
                                          ? 75
                                          : 70,
                                      width: Constants.selectedCategory ==
                                              Constants.categories[index]
                                                  ['name']
                                          ? 50
                                          : 50,
                                      child: Stack(
                                        alignment: Alignment.bottomCenter,
                                        clipBehavior: Clip.none,
                                        children: [
                                          Transform.translate(
                                            offset: Constants
                                                        .selectedCategory ==
                                                    Constants.categories[index]
                                                        ['name']
                                                ? Offset(
                                                    3, -13) // Move up 10 pixels
                                                : Offset(0, 0),
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  Constants.selectedCategory =
                                                      Constants
                                                              .categories[index]
                                                          ['name'];
                                                  Constants.products =
                                                      getFilteredProducts();
                                                  calculateOffsets();
                                                });
                                                WidgetsBinding.instance
                                                    .addPostFrameCallback((_) {
                                                  scrollToCategory(Constants
                                                      .selectedCategory);
                                                });
                                              },
                                              child: ClipRRect(
                                                child: Image.asset(
                                                  Constants.categories[index]
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
                                Constants.categories[index]['name'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 11),
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
                                  child: Constants.isLoading
                                      ? Container(
                                          height: 10,
                                          width: 50,
                                          color: Colors.grey[100],
                                        )
                                      : Text(
                                          '${getFilteredProducts().length} Items in ${Constants.selectedCategory}',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: Constants.fontFamily,
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
                            padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                              decoration: BoxDecoration(
                                color: Constants.container_color,
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: GridView.builder(
                                      controller: Constants.scrollController,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing:
                                            0, // Space between columns
                                        mainAxisSpacing:
                                            0, // Space between rows
                                        childAspectRatio: 0.5, // height
                                      ),
                                      itemCount: Constants.products.length,
                                      itemBuilder: (context, index) {
                                        var product = Constants.products[index];
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
                                              Constants.isLoading
                                                  ? Container(
                                                      height: 100,
                                                      width: double.infinity,
                                                      color: Colors.grey[100],
                                                    )
                                                  : ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      child: Image.asset(
                                                        product['image'],
                                                        height: 100,
                                                        width: double.infinity,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                              SizedBox(height: 3),
                                              Stack(
                                                children: [
                                                  Container(
                                                    height: 20,
                                                    width: 50,
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Constants
                                                              .icon_con_color!,
                                                          Constants
                                                              .icon_con_color!
                                                              .withOpacity(0),
                                                        ],
                                                        begin: Alignment
                                                            .centerLeft,
                                                        end: Alignment
                                                            .centerRight,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    child: Constants.isLoading
                                                        ? Container(
                                                            height: 13,
                                                            width: 25,
                                                            color: Colors
                                                                .grey[100],
                                                          )
                                                        : Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Icon(
                                                                Icons.bolt,
                                                                size: 14,
                                                                color: Constants
                                                                    .icon_color,
                                                              ),
                                                              Text(
                                                                '7 mins',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      Constants
                                                                          .fontFamily,
                                                                  fontSize: 8,
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
                                              Constants.isLoading
                                                  ? Container(
                                                      height: 15,
                                                      width: 40,
                                                      color: Colors.grey[100],
                                                    )
                                                  : Text(
                                                      product['name'],
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: Constants
                                                            .fontFamily,
                                                      ),
                                                    ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: SizedBox(
                                                  child: Divider(
                                                    height: 1,
                                                    color:
                                                        Constants.divider_color,
                                                  ),
                                                ),
                                              ),
                                              Constants.isLoading
                                                  ? Container(
                                                      height: 13,
                                                      width: 13,
                                                      color: Colors.grey[100],
                                                    )
                                                  : Text(
                                                      '${product['quantity']} g',
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        fontFamily: Constants
                                                            .fontFamily,
                                                      ),
                                                    ),
                                              Constants.isLoading
                                                  ? Container(
                                                      height: 13,
                                                      width: 13,
                                                      color: Colors.grey[100],
                                                    )
                                                  : Row(
                                                      children: [
                                                        Text(
                                                          '\u20B9${product['price']}',
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            fontFamily:
                                                                Constants
                                                                    .fontFamily,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        SizedBox(width: 5),
                                                        Text(
                                                          '\u20B9${product['old_price']}',
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            fontFamily:
                                                                Constants
                                                                    .fontFamily,
                                                            color: Colors.grey,
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      side: BorderSide(
                                                        color: Colors
                                                            .grey.shade100,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    backgroundColor: Constants
                                                        .container_color,
                                                    elevation: 1,
                                                  ),
                                                  child: Text(
                                                    'ADD',
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontFamily:
                                                          Constants.fontFamily,
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
