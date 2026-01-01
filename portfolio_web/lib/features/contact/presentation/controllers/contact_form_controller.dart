import 'package:flutter/material.dart';

class ContactFormController {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  Future<bool> sendMessage() async {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    // Simulate network request
    await Future.delayed(const Duration(seconds: 2));

    // Clear form
    nameController.clear();
    emailController.clear();
    subjectController.clear();
    messageController.clear();

    return true;
  }

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    subjectController.dispose();
    messageController.dispose();
  }
}
