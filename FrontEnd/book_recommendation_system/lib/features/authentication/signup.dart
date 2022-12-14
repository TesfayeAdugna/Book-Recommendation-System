import 'package:book_recommendation_system/features/features.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static const String route = "/signup";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.07, vertical: height * 0.06),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(width * 0.03),
                child: Image.asset(
                  "images/bookrecommendationlandingpage.jpg",
                  height: height * 0.4,
                  width: width * 0.85,
                  fit: BoxFit.fill,
                )),
            SizedBox(height: height * 0.04),
            Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  'Sign up',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
            SizedBox(height: height * 0.03),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none),
                        prefixIcon: const Icon(Icons.email),
                        hintText: "Email",
                        fillColor: Color.fromARGB(10, 0, 0, 0),
                        filled: true),
                  ),
                  SizedBox(height: height * 0.02),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none),
                        prefixIcon: const Icon(Icons.lock_outline),
                        hintText: "Password",
                        fillColor: Color.fromARGB(10, 0, 0, 0),
                        filled: true),
                  ),
                  SizedBox(height: height * 0.02),
                  TextFormField(
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none),
                        prefixIcon: const Icon(Icons.lock_outline),
                        hintText: "Confirm Password",
                        fillColor: Color.fromARGB(10, 0, 0, 0),
                        filled: true),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.03),
            BlocConsumer<SignupBloc, SignupState>(
              builder: (context, state) {
                if (state is SignupFailed) {
                  return SizedBox(
                      width: double.maxFinite,
                      height: 50,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Text("Sorry! try again!")));
                } else if (state is SigningUserUp) {
                  return SizedBox(
                      width: double.maxFinite,
                      height: 50,
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                          )));
                }
                return SizedBox(
                    width: double.maxFinite,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          final formValid = _formKey.currentState!.validate();
                          if (!formValid) return;
                          BlocProvider.of<SignupBloc>(context).add(
                            SignupButtonClicked(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                        child: Text(
                          "Sign up",
                          style: TextStyle(fontSize: 20),
                        )));
              },
              listener: (context, state) {
                if (state is SignupSuccessful) {
                  Navigator.pushNamed(context, LoginPage.route);
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Already have an account?"),
                TextButton(
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, LoginPage.route);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
