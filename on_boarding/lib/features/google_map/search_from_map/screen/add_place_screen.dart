import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_boarding/features/google_map/search_from_map/controller/saved_places_controller.dart';

class AddPlaceScreen extends StatelessWidget {
  // কন্ট্রোলারটিকে মেমোরিতে ইনজেক্ট করা
  // final AddPlaceController controller = Get.put(AddPlaceController());
  final controller = Get.put(AddPlaceController());

  AddPlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent[100],
      appBar: AppBar(
        title: Text('Add Place', style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),),
        backgroundColor: Colors.amberAccent[100],
        elevation: 1,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              // searchAddress কল করা হচ্ছে
              onChanged: (value) => controller.searchAddress(value),
              decoration: InputDecoration(
                hintText: 'Search an address',
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                // isLoading এবং suggestions এখন controller থেকে আসবে
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }
                
                if (controller.suggestions.isEmpty) {
                  return Center(child: Text("No results found"));
                }

                return ListView.builder(
                  itemCount: controller.suggestions.length,
                  itemBuilder: (context, index) {
                    final suggestion = controller.suggestions[index];
                    return InkWell(
                      // onLocationSelected কল করা হচ্ছে
                      onTap: () => controller.onLocationSelected(suggestion),
                      child: Card(
                        color: Color(0XFFFFFDF5),
                        margin: EdgeInsets.symmetric(vertical: 6),
                        child: ListTile(
                          title: Text(
                            suggestion['structured_formatting']?['main_text'] ?? "Unknown",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            suggestion['description'] ?? "",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            // Use current location পার্ট...
          ],
        ),
      ),
    );
  }
}