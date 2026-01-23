import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_boarding/features/google_map/search_by_postalCode/controller/postal_controller.dart';
class PostalSearchScreen extends StatelessWidget {
  final controller = Get.put(PostalController());

  PostalSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text('Search by Zip', style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Postal Code", style: TextStyle(
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 8),
            TextField(
              controller: controller.postalCodeController,
              keyboardType: TextInputType.number,
              onChanged: (value) => controller.onPostalCodeChanged(value),
              decoration: InputDecoration(
                hintText: 'Enter Postal Code (e.g. 1209)',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                suffixIcon: Obx(() => controller.isLoading.value 
                  ? Transform.scale(scale: 0.5, child: CircularProgressIndicator()) 
                  : SizedBox()),
              ),
            ),
            SizedBox(height: 20),
            Text("Full Address", style: TextStyle(
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 8),
            TextField(
              controller: controller.addressController,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Address will appear here...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}