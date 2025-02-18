import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static var fontFamily = GoogleFonts.inter().fontFamily;
  static var fontFamily1 = GoogleFonts.robotoSlab().fontFamily;
  static var background_color = Colors.grey[100];
  static var container_color = Colors.white;
  static var icon_color = Colors.grey[600];
  static var icon_text_color = Colors.grey[800];
  static var divider_color = Colors.grey[300];
  static var button_text_color = Colors.green[700];
  static var appBarBackgroundColor = Colors.white;
  static var icon_con_color = Colors.grey[200];
  static var image_con_color1 = Colors.pink[900];
  static var image_con_color = Colors.white;
  static var image_con_color2 = Colors.grey[100];
  static bool isVisible = false;
  static List<Map<String, dynamic>> categories = [
    {'name': 'Electronics', 'image': 'assets/ps2.png'},
    {'name': 'Furniture', 'image': 'assets/chair2.png'},
    {'name': 'Chips', 'image': 'assets/lays11.png'},
    {'name': 'Pringles', 'image': 'assets/pringles4.png'},
    {'name': 'Dress', 'image': 'assets/dress1.png'},
    {'name': 'Fruits', 'image': 'assets/converted_image-1.png'},
    {'name': 'Vegtable', 'image': 'assets/veg.png'},
    {'name': 'Groceries', 'image': 'assets/gro.png'},
  ];

  static List<Map<String, dynamic>> products = [
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
  static late bool isLoading;
  static String selectedCategory = '';
  static ScrollController scrollController = ScrollController();
  static final Map<String, double> categoryOffsets = {};
  static late AnimationController animationController;

}
