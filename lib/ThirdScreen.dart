import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ThirdScreen extends StatefulWidget {
  int a = 0;
  int b = 0;
  ThirdScreen({Key key, this.a, this.b}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  int c, d;
  int length;
  List<int> values;
  List<bool> isSelected = [false,false,false,false,false,false];
  TextEditingController searchController = TextEditingController();
  String searchText = '';
  bool found = false;

  @override
  void initState(){
    super.initState();
    c = widget.a;
    d = widget.b;
    length = c * d;
    values = List.generate(c * d, (i) => i + 1);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GridView Task"),),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(widget.a * widget.b, (index) {
                return Center(
                  child: Text(
                    'Item ${values[index]}',
                    style: TextStyle(
                      color: isSelected[index] ? Colors.red : null,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 50),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                      controller: searchController, decoration: InputDecoration(labelText: "Search An Element")),
                ),
                Expanded(
                    child: ElevatedButton(
                      child: Text("Search"),
                      onPressed: () {
                        isSelected = [false,false,false,false,false,false];
                        searchText = searchController.text;
                        for(int i = 0; i < values.length; i++){
                          if(int.tryParse(searchText) == values[i]){
                            setState(() {
                              isSelected[i] = true;
                            });
                          }
                        }
                      },
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
