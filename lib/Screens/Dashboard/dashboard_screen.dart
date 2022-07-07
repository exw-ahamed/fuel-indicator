import 'package:flutter/material.dart';
import 'package:fuel_indicator/Components/main_drawer.dart';
import 'package:fuel_indicator/Components/textfield_container.dart';

class DashboardScreen extends StatefulWidget {
  // final TextEditingController controller;
  const DashboardScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  TextEditingController milageController = TextEditingController();
  TextEditingController vehicleController = TextEditingController();

  void onListen() => setState(() {});

  void initState() {
    super.initState();

    // widget.controller.addListener(onListen);
  }

  @override
  void dispose() {
    // widget.controller.removeListener(onListen);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: const Color(0xFF00355a),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/gas-station.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(25.0),
                padding: const EdgeInsets.all(15.0),
                // height: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                  // image: const DecorationImage(
                  //   image: const AssetImage("assets/images/gas-station.jpg"),
                  //   fit: BoxFit.cover,
                  // ),
                ),
                child: Center(
                  child: vehicleForm(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget vehicleForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 10, right: 10, left: 10),
        child: Column(
          children: [
            Container(
              child: const Text(
                "Enter your Vehicle Details",
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
            milageField(),
            vehicleNumberField(),
            // const SizedBox(
            //   height: 10,
            // ),
            // forgotPassword(context),
            const SizedBox(
              height: 20,
            ),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget usernameField() {
    return TextFieldContainer(
      child: TextFormField(
        controller: emailController,
        decoration: const InputDecoration(
          hoverColor: Color(0xFF00355a),
          fillColor: Color(0xFF344b5f),
          focusColor: Color(0xFF00355a),
          hintText: 'Enter Your Name',
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.person,
            color: Color(0xFF00355a),
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        autofillHints: const [AutofillHints.email],
        validator: (value) {
          if (value!.isEmpty) {
            return 'This field is required';
          }
        },
        // onSaved: (value) => _email = value,
        // onChanged: (value) => context.read<LoginBloc>().add(
        //       LoginUsernameChange(username: value),
        //     ),
      ),
    );
  }

  Widget milageField() {
    return TextFieldContainer(
      child: TextFormField(
        controller: milageController,
        decoration: const InputDecoration(
          hintText: 'Enter your Milage',
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.gas_meter,
            color: Color(0xFF00355a),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'This field is required';
          }
          // if (value.length < 20) {
          //   return 'Password should have 8 characters';
          // }
        },
      ),
    );
  }

  Widget vehicleNumberField() {
    return TextFieldContainer(
      child: TextFormField(
        controller: vehicleController,
        decoration: const InputDecoration(
          hintText: 'Enter your Vehicle number',
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14.0),
          prefixIcon: Icon(
            Icons.car_rental,
            color: Color(0xFF00355a),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'This field is required';
          }
          // if (value.length < 20) {
          //   return 'Password should have 8 characters';
          // }
        },
      ),
    );
  }

  Widget submitButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {},
        padding: const EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: const Color(0xFF00355a),
        child: const Text(
          "SUBMIT",
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
}
