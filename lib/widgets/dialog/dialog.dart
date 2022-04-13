
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void openDialog({String ?message1, String ?message2}) {
  Get.dialog(
    AlertDialog(
      title:  Text(message1!),
      content:  Text(message2!),
      actions: [
        TextButton(
          child: const Text("Close"),
          onPressed: () => Get.back(),
        ),
      ],
    ),
  );
}