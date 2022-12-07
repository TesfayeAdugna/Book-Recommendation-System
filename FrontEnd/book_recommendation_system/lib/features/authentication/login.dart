import 'package:book_recommendation_system/features/features.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String route = "/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.07, vertical: height * 0.06),
          child: Column(
            children: <Widget>[
              const Text("Hello Again!",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
              SizedBox(height: height * 0.03),
              const Text("Welcome back You've been missed!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300)),
              SizedBox(height: height * 0.03),
              Container(
                  alignment: Alignment.bottomLeft,
                  child: const Text('Log in',
                      style: TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold))),
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
                          fillColor: const Color.fromARGB(10, 0, 0, 0),
                          filled: true),
                    ),
                    SizedBox(height: height * 0.02),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none),
                          prefixIcon: const Icon(Icons.lock_outline),
                          hintText: "Password",
                          fillColor: const Color.fromARGB(10, 0, 0, 0),
                          filled: true),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.03),
              // BlocBuilder<LoginBloc, LoginState>(
              //   builder: (context, state) {
              //     if (state is LoginFailed) {
              //       return Text(
              //         state.error,
              //         style: MicroYelpText.error,
              //       );
              //     } else if (state is LoggingIn) {
              //       return const CircularProgressIndicator();
              //     }
              //     return Container();
              //   },
              // ),

              SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 20),
                      ))),

              // BlocListener<LoginBloc, LoginState>(
              //   listener: (context, state) {
              //     if (state is LoginSuccessfull) {
              //       Navigator.pushNamedAndRemoveUntil(
              //           context, HomePageNavigator.route, (route) => false);
              //       // Navigator.pushReplacementNamed(context, HomePageNavigator.route);
              //     }
              //   },
              //   child: RoundedButton(
              //       buttonText: "Login",
              //       onClick: () {
              //         if (_formKey.currentState!.validate()) {
              //           BlocProvider.of<LoginBloc>(context).add(
              //             LoginSubmitted(
              //               email: emailController.text,
              //               password: passwordController.text,
              //             ),
              //           );
              //         }
              //       },
              //       buttonColor: MicroYelpColor.primaryColor,
              //       textStyle: MicroYelpText.buttonText),
              // ),
              SizedBox(height: height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Text('New to '),
                  const Text("This app?",
                      style: TextStyle(fontStyle: FontStyle.italic)),
                  TextButton(
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, SignUpPage.route);
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
