import 'package:flutter/material.dart';
import 'trip_data_model.dart';

class TripDetailsScreen extends StatefulWidget {
  const TripDetailsScreen({super.key});

  @override
  State<TripDetailsScreen> createState() => _TripDetailsScreenState();
}

class _TripDetailsScreenState extends State<TripDetailsScreen> {
  // Form state and controllers
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _destinationController = TextEditingController();
  final _noOfDaysController = TextEditingController();
  final _travelCostController = TextEditingController();
  final _hotelController = TextEditingController();
  final _foodExpenseController = TextEditingController();
  final _otherExpenseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trip Details Form"),
        backgroundColor: Colors.amberAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildTextField(
                    _nameController, "Enter Traveller Name:", TextInputType.text),
                const SizedBox(height: 20),
                _buildTextField(_destinationController, "Enter Destination:",
                    TextInputType.text),
                const SizedBox(height: 20),
                _buildTextField(_noOfDaysController, "Enter No. of Days:",
                    TextInputType.number),
                const SizedBox(height: 20),
                _buildTextField(_travelCostController, "Enter Travel Cost:",
                    TextInputType.number),
                const SizedBox(height: 20),
                _buildTextField(_hotelController, "Enter Hotel Cost:",
                    TextInputType.number),
                const SizedBox(height: 20),
                _buildTextField(_foodExpenseController, "Enter Food Expense:",
                    TextInputType.number),
                const SizedBox(height: 20),
                _buildTextField(_otherExpenseController, "Enter Other Expenses:",
                    TextInputType.number),
                const SizedBox(height: 25),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 14),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final trip = Trip(
                        name: _nameController.text,
                        destination: _destinationController.text,
                        noOfDays: int.parse(_noOfDaysController.text),
                        travelCost: int.parse(_travelCostController.text),
                        hotel: int.parse(_hotelController.text),
                        food: int.parse(_foodExpenseController.text),
                        other: int.parse(_otherExpenseController.text),
                      );

                      Navigator.pushNamed(
                        context,
                        '/result',
                        arguments: trip,
                      );
                    }
                  },
                  child: const Text("Submit Details"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String label, TextInputType type) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please fill out this field!";
        }
        return null;
      },
    );
  }
}
