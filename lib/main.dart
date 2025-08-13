import 'package:flutter/material.dart';
import 'package:login_screen_api/api/post_api.dart';

import 'model/post_data_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  bool isLoading = false;
  PostDataModel postModel = PostDataModel();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("POST API"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(labelText: "Enter Name"),
              ),
              SizedBox(height: 10),
              TextField(
                controller: email,
                decoration: InputDecoration(labelText: "Enter Email"),
              ),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });

                    Map<String, dynamic> post = {
                      "title": name.text,
                      "body": email.text,
                      "userId": 1,
                    };

                    final result = await PostAPI.createPost(post);

                    setState(() {
                      isLoading = false;
                    });

                    if (result != null) {
                      print("Created: ${result.title}");
                    } else {
                      print("Failed to create user");
                    }
                  },
                  child: Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
