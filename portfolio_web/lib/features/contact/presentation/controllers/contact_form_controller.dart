import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ContactFormController {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> sendMessage() async {
    if (!formKey.currentState!.validate()) {
      return "Validation failed";
    }

    try {
      final Map<String, dynamic> data = {
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'subject': subjectController.text.trim(),
        'message': messageController.text.trim(),
        'timestamp': FieldValue.serverTimestamp(),
      };

      await _firestore
          .collection('contacts')
          .add(data)
          .timeout(
            const Duration(seconds: 7),
            onTimeout: () =>
                throw 'Connection Timeout. Please check your internet or Firebase Console.',
          );

      nameController.clear();
      emailController.clear();
      subjectController.clear();
      messageController.clear();

      return null; // Success
    } catch (e) {
      debugPrint('Error: $e');
      return e.toString();
    }
  }

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    subjectController.dispose();
    messageController.dispose();
  }
}
