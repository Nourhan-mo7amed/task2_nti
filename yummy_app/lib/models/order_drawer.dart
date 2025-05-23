import 'package:flutter/material.dart';

class OrderDrawer extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController contactNameController;
  final TextEditingController dateController;
  final TextEditingController timeController;
  final Map<String, int> cartItems;
  final double totalCost;

  const OrderDrawer({
    super.key,
    required this.formKey,
    required this.contactNameController,
    required this.dateController,
    required this.timeController,
    required this.cartItems,
    required this.totalCost,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * .88,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Order Details",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.pink.shade100,
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.pedal_bike_rounded),
                            const SizedBox(width: 10),
                            const Text('Delivery'),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.shopping_bag),
                            const SizedBox(width: 10),
                            const Text('PickUp'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                TextFormField(
                  controller: contactNameController,
                  decoration: const InputDecoration(hintText: "Contact Name"),
                  validator: (value) => value == null || value.isEmpty
                      ? "Contact Name Can't be Empty"
                      : null,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: _buildDateField(context)),
                    const SizedBox(width: 10),
                    Expanded(child: _buildTimeField(context)),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  "Order Summary",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 18),
                ),
                const SizedBox(height: 10),
                Text(
                  "You have selected ${cartItems.length} items",
                  style: const TextStyle(fontSize: 16),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink.shade100,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 48,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Order Submitted')),
                        );
                      }
                    },
                    child: Text(
                      "Submit Order - \$${totalCost.toStringAsFixed(2)}",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDateField(BuildContext context) {
    return TextFormField(
      controller: dateController,
      readOnly: true,
      decoration: const InputDecoration(hintText: "Select Date"),
      onTap: () async {
        DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
        );
        if (picked != null) {
          dateController.text = "${picked.toLocal()}".split(' ')[0];
        }
      },
      validator: (value) => value == null || value.isEmpty ? "Empty Date" : null,
    );
  }

  Widget _buildTimeField(BuildContext context) {
    return TextFormField(
      controller: timeController,
      readOnly: true,
      decoration: const InputDecoration(hintText: "Select Time"),
      onTap: () async {
        TimeOfDay? picked = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (picked != null) {
          timeController.text = picked.format(context);
        }
      },
      validator: (value) => value == null || value.isEmpty ? "Empty Time" : null,
    );
  }
}