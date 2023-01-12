import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_button.dart';

class CustomConfirmDialog extends StatelessWidget {
  const CustomConfirmDialog({
    Key? key,
    required this.description,
  }) : super(key: key);

  final String description;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "notice".tr,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: CustomButton.textButton(
                          roundedBorder: 15,
                          child: const Icon(Icons.close, size: 20),
                          onPressed: () {
                            Get.back();
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Container(height: 0.3, color: Colors.grey),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                child: SingleChildScrollView(
                  child: Center(
                    child: Text(
                      description,
                      softWrap: true,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.07,
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton.textButton(
                        radiusBottomLeft: 15,
                        child: Container(
                          alignment: Alignment.center,
                          height: double.infinity,
                          child: Text("no".tr),
                        ),
                        onPressed: () {
                          Get.back(result: false);
                        }),
                  ),
                  Expanded(
                    child: CustomButton.textButton(
                        radiusBottomRight: 15,
                        child: Container(
                          alignment: Alignment.center,
                          height: double.infinity,
                          child: Text("yes".tr),
                        ),
                        onPressed: () {
                          Get.back(result: true);
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
