import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_boarding/features/google_map/search_by_postalCode/service/postal_service.dart';

class PostalController extends GetxController {
  // TextField-er sathe connect korar jonno controller
  final postalCodeController = TextEditingController();
  final addressController = TextEditingController();
  
  var isLoading = false.obs;

  // Postal code change hole ai function call hobe
  void onPostalCodeChanged(String value) async {
    if (value.length >= 4) { // Bangladesh ba onno desher min length
      isLoading.value = true;
      
      String? fetchedAddress = await PostalService.getAddressFromZip(value);
      
      if (fetchedAddress != null) {
        // Address field-e text set kore dewa
        addressController.text = fetchedAddress;
      }
      isLoading.value = false;
    } else {
      addressController.clear();
    }
  }

  @override
  void onClose() {
    postalCodeController.dispose();
    addressController.dispose();
    super.onClose();
  }
}