import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Widgets'),
        ),
        body: Form(
          key: _formkey,
          child: Column(children: [
            TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter Name:',
                  labelText: 'Name',
                )),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter valid phone number';
                }
              },
              decoration: InputDecoration(
                icon: Icon(Icons.phone),
                hintText: 'Enter a phone number',
                labelText: 'phone',
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter valid date';
                }
              },
              decoration: InputDecoration(
                  icon: Icon(Icons.calendar_today),
                  hintText: 'Enter D.O.B.',
                  labelText: 'D.O.B.'),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Data is processing...')));
                    }
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            )
          ]),
        ));
  }
}
