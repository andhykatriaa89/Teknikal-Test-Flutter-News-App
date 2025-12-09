import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AuthController extends GetxController {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  var showPassword = false.obs;
  var isLoading = false.obs;
  var passwordError = ''.obs;
  var globalError = ''.obs;

  void login() {
    isLoading.value = true;

    globalError.value = '';
    passwordError.value = '';

    String email = emailCtrl.text.trim();
    String pass = passCtrl.text.trim();

    if (email.isEmpty || pass.isEmpty) {
      globalError.value = 'Please fill in all fields';
      isLoading.value = false;
      return;
    }

    if (pass.length < 8) {
      globalError.value = 'Password must be at least 8 characters';
      isLoading.value = false;
      return;
    }

    if (!users.containsKey(email)) {
      globalError.value = 'Email not registered';
      isLoading.value = false;
      return;
    }

    if (users[email] != pass) {
      globalError.value = 'Incorrect password';
      isLoading.value = false;
      return;
    }

    Get.offAllNamed('/main');

    isLoading.value = false;
  }

  Future<void> register() async {
    isLoading.value = true;
    globalError.value = '';
    passwordError.value = '';
  
    String email = emailCtrl.text.trim();
    String pass = passCtrl.text.trim();

    if (email.isEmpty || pass.isEmpty) {
      globalError.value = 'Please fill in all fields';
      isLoading.value = false;
      return;
    }
    if (pass.length < 8) {
      globalError.value = 'Password must be at least 8 characters';
      isLoading.value = false;
      return;
    }
    if (!email.contains('@')) {
      globalError.value = 'Invalid email format';
      isLoading.value = false;
      return;
    }
    if (users.containsKey(email)) {
      globalError.value = 'Email sudah terdaftar';
      isLoading.value = false;
      return;
    }
    users[email] = pass;
    await _saveUsers();
    isLoading.value = false;
    Get.snackbar('Success', 'Registration successful');
    Get.offAllNamed('/main');
  }

  RxMap<String, String> users = RxMap<String, String>();

  @override
  void onInit() {
    super.onInit();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('users');
    if (userData != null) {
      users.value = Map<String, String>.from(jsonDecode(userData));
    }
  }

  Future<void> _saveUsers() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('users', jsonEncode(users));
  }
}