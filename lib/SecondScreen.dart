import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:atask/ThirdScreen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  TextEditingController heightcontroller = TextEditingController();
  TextEditingController widthcontroller = TextEditingController();

  String height, width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              controller: heightcontroller,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter height';
                }
              },
              onSaved: (newValue) {
                height = newValue;
              },
              decoration: InputDecoration(labelText: "Enter Height"),
            ),
            TextFormField(
              controller: widthcontroller,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter width';
                }
              },
              onSaved: (newValue) {
                width = newValue;
              },
              decoration: InputDecoration(labelText: "Enter Width"),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ThirdScreen(
                        a: int.tryParse(heightcontroller.text),
                        b: int.tryParse(widthcontroller.text),
                      ),
                    ),
                  );
                },
                child: Text("Submit")),
          ],
        ),
      ),
    );
  }
}
