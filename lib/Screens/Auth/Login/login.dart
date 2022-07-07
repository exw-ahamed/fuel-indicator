import 'package:flutter/material.dart';
import 'package:fuel_indicator/Components/textfield_container.dart';
import 'package:fuel_indicator/Screens/Dashboard/dashboard_screen.dart';

class Login extends StatefulWidget {
  final TextEditingController controller;
  const Login({Key? key, required this.controller}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  bool _isObscure = true;

  void onListen() => setState(() {});

  void initState() {
    super.initState();

    widget.controller.addListener(onListen);
  }

  @override
  void dispose() {
    widget.controller.removeListener(onListen);

    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();

  String message = '';

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf3f3f3),
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/gas-station.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 120.0,
              ),
              child: loginForm(),
            ),
          ),
        ),
      ),
    );
  }

  Widget loginForm() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              Container(
                child: const Text(
                  "Login to Account",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              usernameField(),
              passwordField(),
              // const SizedBox(
              //   height: 10,
              // ),
              // forgotPassword(context),
              const SizedBox(
                height: 20,
              ),
              loginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget usernameField() {
    return TextFieldContainer(
      child: TextFormField(
        controller: emailController,
        decoration: InputDecoration(
          hoverColor: const Color(0xFF00355a),
          fillColor: const Color(0xFF344b5f),
          focusColor: const Color(0xFF00355a),
          hintText: 'Your Email',
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(top: 14.0),
          prefixIcon: const Icon(
            Icons.mail,
            color: Color(0xFF00355a),
          ),
          suffixIcon: widget.controller.text.isEmpty
              ? Container(
                  width: 0,
                )
              : IconButton(
                  icon: const Icon(Icons.close),
                  color: const Color(0xFF00355a),
                  onPressed: () => widget.controller.clear(),
                ),
        ),
        keyboardType: TextInputType.emailAddress,
        autofillHints: const [AutofillHints.email],
        validator: (value) {
          if (value!.isEmpty) {
            return 'This field is required';
          }
          if (!value.contains('@')) {
            return "A valid email should contain '@'";
          }
          if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
          ).hasMatch(value)) {
            return "Please enter a valid email";
          }
        },
        // onSaved: (value) => _email = value,
        // onChanged: (value) => context.read<LoginBloc>().add(
        //       LoginUsernameChange(username: value),
        //     ),
      ),
    );
  }

  Widget passwordField() {
    return TextFieldContainer(
      child: TextFormField(
        controller: passwordController,
        obscureText: _isObscure,
        decoration: InputDecoration(
          hintText: 'Password',
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(top: 14.0),
          prefixIcon: const Icon(
            Icons.lock,
            color: Color(0xFF00355a),
          ),
          suffixIcon: IconButton(
            icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
            color: const Color(0xFF00355a),
            onPressed: () => setState(() {
              _isObscure = !_isObscure;
            }),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'This field is required';
          }
          if (value.length < 8) {
            return 'Password should have 8 characters';
          }
        },
      ),
    );
  }

  Widget forgotPassword(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const ForgotPasswordScreen(),
        //   ),
        // );
      },
      child: Container(
        alignment: Alignment.center,
        child: const Text(
          'Forgot Password',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xFF00355a),
            fontFamily: 'Roboto',
          ),
        ),
      ),
    );
  }

  Widget loginButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          // if (_formKey.currentState!.validate()) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const DashboardScreen(),
            ),
          );
          // }
        },
        padding: const EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: const Color(0xFF00355a),
        child: const Text(
          "LOGIN",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            letterSpacing: 1.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Widget loginButton() {
  //   return Builder(builder: (context) {
  //     return FlatButton(
  //       minWidth: double.infinity,
  //       padding: const EdgeInsets.symmetric(vertical: 15),
  //       onPressed: () {
  //         // if (_formKey.currentState!.validate()) {
  //         //   login(context);
  //         // }
  //       },
  //       color: Color(0xFF00355a),
  //       shape: const StadiumBorder(),
  //       child: isLoading
  //           ? const CircularProgressIndicator(
  //               color: Colors.white,
  //             )
  //           : const Text(
  //               'LOGIN',
  //               style: TextStyle(
  //                 fontSize: 18,
  //                 color: Colors.white,
  //                 fontFamily: 'Proxima',
  //               ),
  //             ),
  //     );
  //   });
  // }
}
