import 'package:april17/tools/common_submit_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefPage extends StatefulWidget {
  const SharedPrefPage({Key? key}) : super(key: key);

  @override
  _SharedPrefPageState createState() => _SharedPrefPageState();
}

class _SharedPrefPageState extends State<SharedPrefPage> {

  final Future<SharedPreferences> _myPref = SharedPreferences.getInstance();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final String usernameDB = "admin";
  final String passwordDB = "admin";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preference'),
      ),
      body: Container(
        child: Column(
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: 'Username',
              ),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            _buildLoginButton(),
            _buildLogoutButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton(){
    return CommonSubmitButton(
      labelButton: "Log In",
      submitCallback: (value){
        String currentUsername = _usernameController.value.text;
        String currentPassword= _passwordController.value.text;

        _processLogin(currentUsername, currentPassword);
      }
    );
  }

  Widget _buildLogoutButton(){
    return CommonSubmitButton(
        labelButton: "Log Out",
        submitCallback: (value){
          _processLogout();
        }
    );
  }

  void _processLogin(String username, String password) async {
    if (username == usernameDB && password == passwordDB) {
      SharedPreferences getPref = await _myPref;
      await getPref.setBool("loginStatus", true);
    }
  }

  void _processLogout() async {
     SharedPreferences getPref = await _myPref;
     await getPref.setBool("loginStatus", false);
  }
}
