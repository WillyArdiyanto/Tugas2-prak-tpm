import 'package:flutter/material.dart';
import 'package:april17/tools/common_submit_button.dart';
import 'shared_pref_page.dart';


class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  _HomePageBodyState createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("Module 5", style: TextStyle(fontSize: 24),),
          CommonSubmitButton(
              labelButton: "Shared Preferenced",
              submitCallback: (String value) {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SharedPrefPage())
                );
              }),
          CommonSubmitButton(
              labelButton: "Hive Database",
              submitCallback: (String value) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SharedPrefPage())
                );
              }),
        ],
      ),
    );
  }
}
