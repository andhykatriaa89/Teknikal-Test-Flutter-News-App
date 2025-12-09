import 'package:flutter/material.dart';
import 'package:get/Get.dart';
import 'package:ragdanews/core/routes/app_routes.dart';
import 'package:ragdanews/presentation/controllers/auth_controller.dart';


class LoginPage extends StatelessWidget {
  final AuthController ctrl = Get.put(AuthController());

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 211,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(83, 157, 243, 0.9),
              image: DecorationImage(
                image: const AssetImage('assets/images/bacgroundheader.png'),
                fit: BoxFit.cover,
                opacity: 0.10,
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'RAGDANews',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'Please log into your account',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Email Field
                    TextField(
                      controller: ctrl.emailCtrl,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Cth. contoh@gmail.com',
                        prefixIcon: Icon(Icons.person_outline),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Password Field
                    Obx(() => TextField(
                      controller: ctrl.passCtrl,
                      obscureText: !ctrl.showPassword.value,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter password',
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(ctrl.showPassword.value ? Icons.visibility : Icons.visibility_off),
                          onPressed: () => ctrl.showPassword.toggle(),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    )),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {}, // TODO: Implement forgot password
                        child: const Text('Forgot Password?', style: TextStyle(color: Colors.red)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => Get.toNamed(AppRoutes.register),
                        child: const Text('Don\'t have an account? Register'),
                      ),
                    ),

                    // Global Error
                    Obx(() => ctrl.globalError.value.isNotEmpty
                        ? Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(color: Colors.red.shade100, borderRadius: BorderRadius.circular(8)),
                            child: Row(children: [
                              const Icon(Icons.error, color: Colors.red),
                              const SizedBox(width: 8),
                              Text(ctrl.globalError.value, style: const TextStyle(color: Colors.red)),
                            ]),
                          )
                        : const SizedBox(height: 20)),

                    const SizedBox(height: 20),

                    // Login Button
                    Obx(() => SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (ctrl.isLoading.value) return;
                          if (ctrl.emailCtrl.text.isEmpty || ctrl.passCtrl.text.isEmpty) {
                            ctrl.globalError.value = 'Email and password are required';
                            return;
                          }
                          ctrl.login();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        child: ctrl.isLoading.value 
                                ? const CircularProgressIndicator(color: Colors.white,) 
                                : const Text('Enter', style: TextStyle(color: Colors.white)),
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}