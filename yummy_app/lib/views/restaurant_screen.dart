import 'package:flutter/material.dart';
import '../components/card_fab.dart';
import '../components/restaurant_header.dart';
import '../components/restaurant_info.dart';
import '../models/meal_bottom.dart';
import '../models/meal_item.dart';
import '../models/order_drawer.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _contactNameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  final Map<String, int> cartItems = {};
  double totalCost = 0.0;

  @override
  void dispose() {
    _contactNameController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    super.dispose();
  }

  void addToCart(String title, double price, int quantity) {
    setState(() {
      for (int i = 0; i < quantity; i++) {
        cartItems.update(title, (value) => value + 1, ifAbsent: () => 1);
        totalCost += price;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          RestaurantHeader(
            onBack: () => Navigator.of(context).pop(),
            onMenu: () => _scaffoldKey.currentState?.openEndDrawer(),
          ),
          const RestaurantInfo(),
          MenuItemsList(onItemSelected: _showMealBottomSheet),
        ],
      ),
      floatingActionButton: CartFAB(
        itemCount: cartItems.values.fold(0, (sum, item) => sum + item),
        onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      endDrawer: OrderDrawer(
        formKey: _formKey,
        contactNameController: _contactNameController,
        dateController: _dateController,
        timeController: _timeController,
        cartItems: cartItems,
        totalCost: totalCost,
      ),
    );
  }

  void _showMealBottomSheet({
    required String title,
    required String imageAsset,
    required String description,
    required double price,
  }) {
    int quantity = 1;
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return MealBottomSheetContent(
              title: title,
              imageAsset: imageAsset,
              description: description,
              price: price,
              quantity: quantity,
              onDecrement:
                  quantity > 1 ? () => setModalState(() => quantity--) : null,
              onIncrement: () => setModalState(() => quantity++),
              onAddToCart: () {
                addToCart(title, price, quantity);
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }
}
