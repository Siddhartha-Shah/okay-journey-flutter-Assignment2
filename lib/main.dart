import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import './NextPage.dart';
import 'package:image_picker/image_picker.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Form(),
    );
  }
}
class Form extends StatefulWidget {
  const Form({Key? key}) : super(key: key);
  @override
  _FormState createState() => _FormState();

}
class _FormState extends State<Form> {
  TextEditingController _name = TextEditingController();
  File? selectImage;
  String base64Image="";
  Future<void> chooseImage(type) async{
    var img;
    final ImagePicker _picker = ImagePicker();

    if(type=="camera") {
      img=await _picker.pickImage(source: ImageSource.camera,imageQuality: 10);
    }else{
      img=await _picker.pickImage(source: ImageSource.gallery,imageQuality: 25);
    }if(img!=null){
      setState(() {
        selectImage=File(img.path);
        base64Image=base64Encode(selectImage!.readAsBytesSync());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.deepOrange,
              child: TextButton(onPressed: (){
                chooseImage("Gallery");
              },child: const Text("Upload Image"),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _name,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter your favourite actor name'
                ),
              ),
            ),

            ElevatedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NextPage(name: _name.text)));
            }, child: const Text('Go Next Page'))
          ],
        ),
      ),
    );
  }
}

