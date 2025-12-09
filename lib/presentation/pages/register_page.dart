import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ragdanews/presentation/controllers/auth_controller.dart';

class RegisterPage extends StatelessWidget {
  final AuthController authCtrl = Get.find<AuthController>();
  final TextEditingController confirmPasswordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Register',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 48),
              TextField(
                controller: authCtrl.emailCtrl,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: authCtrl.passCtrl,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: confirmPasswordCtrl,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Confirm Password'),
              ),
              const SizedBox(height: 8),
              Obx(() => authCtrl.globalError.value.isNotEmpty 
                ? Text(
                    authCtrl.globalError.value,
                    style: TextStyle(color: Colors.red),
                  )
                : SizedBox.shrink()),
              const SizedBox(height: 8),
              const SizedBox(height: 24),
              Obx(() => authCtrl.isLoading.value
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        if (authCtrl.passCtrl.text == confirmPasswordCtrl.text) {
                          authCtrl.register();
                        } else {
                          Get.snackbar('Error', 'Passwords do not match');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('Register'),
                    )),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => Get.back(),
                child: const Text('Already have an account? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}