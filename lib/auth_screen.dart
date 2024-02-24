import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _AuthScreenState();
}

FirebaseAuth auth = FirebaseAuth.instance;

class _AuthScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();


    Future<void> signIn() async {
      if (formKey.currentState!.validate()) {
        await auth
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text)
            .whenComplete(
              () => ScaffoldMessenger.of(context)
                  .showSnackBar(
                    const SnackBar(
                      content: Text("Successfully Signed In"),
                    ),
                  )
                  .closed
                  .whenComplete(
                    () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    ),
                  ),
            );
      }
    }

    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Welcome Back \nyou were missed..',
                  style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 100),
              TextForm(
                controller: emailController,
                text: 'Email..',
                label: 'Enter your email',
              ),
              TextForm(
                controller: passwordController,
                text: 'Password..',
                label: 'Enter your 9 digit password',
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 50,
                  width: 500,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[200]),
                    onPressed: () {
                      signIn();
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 50,
                  width: 500,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[200]),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupScreen()));
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  


  @override
  Widget build(BuildContext context) {

    Future<void> signUp() async {
      if (formKey.currentState!.validate()) {
        await auth
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text)
            .whenComplete(
              () => ScaffoldMessenger.of(context)
                  .showSnackBar(
                    const SnackBar(
                      content: Text("Successfully Signed In"),
                    ),
                  )
                  .closed
                  .whenComplete(
                    () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    ),
                  ),
            );
      }
    }

    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Register YourSelf..',
                  style: TextStyle(fontSize: 46, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 100),
              TextForm(
                controller: emailController,
                text: 'Email..',
                label: 'Enter your email',
              ),
              TextForm(
                controller: passwordController,
                text: 'Password..',
                label: 'Enter your 9 digit password',
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 50,
                  width: 500,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[200]),
                    onPressed: () {
                      signUp();
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}

class TextForm extends StatelessWidget {
  const TextForm({
    super.key,
    required this.controller,
    required this.text,
    required this.label,
  });

  final String text;
  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          icon: const Icon(Icons.person),
          hintText: label,
          labelText: text,
          filled: true,
          // fillColor: Colors.blue,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.greenAccent),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onChanged: (String? value) {},
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );
  }
}
