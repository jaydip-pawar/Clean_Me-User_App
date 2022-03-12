import 'package:clean_me/providers/authentication_provider.dart';
import 'package:clean_me/screens/login/login_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  static const String id = 'sign-up-screen';


  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  String _name = "", _email = "", _password = "", _mobileNumber = "", _confirmPassword = "";
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  void _toggle(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {

    final authentication = Provider.of<AuthenticationProvider>(context);

    void validateSignup() {
      if(_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        authentication.signUp(_name, _email, _password, int.parse(_mobileNumber), context);
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 50),
                const Text(
                  "Create Account,",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text(
                  "Sign up to get started!",
                  style: TextStyle(fontSize: 20, color: Colors.grey.shade400),
                ),
                const SizedBox(height: 50),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Full Name",
                    labelStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w600),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                  validator: (name){
                    if (name!.isEmpty) {
                      return 'Please Enter your Name';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (name)=> _name = name!,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email ID",
                    labelStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w600),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                  validator: (email) {
                    if (email!.isEmpty) {
                      return 'Please Enter email ID';
                    } else if (!EmailValidator.validate(email)) {
                      return 'Enter valid email address';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (email)=> _email = email!,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Mobile number",
                    labelStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w600),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                  validator: (mobileNumber) {
                    if (mobileNumber!.isEmpty) {
                      return 'Please Enter mobile number';
                    } else if (mobileNumber.length < 10 ) {
                      return 'Invalid mobile number';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (mobileNumber)=> _mobileNumber = mobileNumber!,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w600),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey.shade600,
                      ),
                      onPressed: _toggle,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                  validator: (password){
                    String pattern =
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                    RegExp regex = RegExp(pattern);
                    if (password!.isEmpty){
                      return 'Please Enter Password';
                    }else if (password.length < 8) {
                      return 'Password must be between 8 and 30 characters';
                    } else if (!regex.hasMatch(password)) {
                      return 'Passwords must contain:\n  - at least 1 uppercase [A-Z]\n  - at least 1 lowercase [a-z]\n  - at least 1 number [0-9]\n  - at least 1 Special Character';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (password)=> _password = password!,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    labelStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade400,
                        fontWeight: FontWeight.w600),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.red),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                  validator: (confirmPassword){
                    if(confirmPassword != _passwordController.text) {
                      return "Password not matching";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (confirmPassword)=> _confirmPassword = confirmPassword!,
                  textInputAction: TextInputAction.done,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 50,
                  child: MaterialButton(
                    onPressed: () {
                      validateSignup();
                    },
                    padding: const EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Ink(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xffff5f6d),
                            Color(0xffff5f6d),
                            Color(0xffffc371),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        constraints: const BoxConstraints(
                            minHeight: 50, maxWidth: double.infinity),
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () => {
                      // authentication.signInWithGoogle()
                    },
                    color: Colors.indigo.shade50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "assets/images/google.png",
                          height: 18,
                          width: 18,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "Sign in with google",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "I'm already a member.",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, LoginScreen.id);
                        },
                        child: const Text(
                          "Sign in.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.red),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
