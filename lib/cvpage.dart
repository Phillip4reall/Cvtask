// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:cvdisplay/model.dart';
import 'package:flutter/material.dart';

class CvDisplay extends StatefulWidget {
  const CvDisplay({super.key});

  @override
  _CvDisplayState createState() => _CvDisplayState();
}

class _CvDisplayState extends State<CvDisplay> {
  final Cvmodel details = Cvmodel(
      'gbengaoyeladun@gmail.com',
      'I am a mobile app developer for both iOs and Android devices. I am proficient with using cross platform frameworks(Flutter). I have worked on some projects from concept to completion and not only I can develop applications based on specifications.',
      'Oyeladun Olugbenga Phillp',
      'Phillip4reall',
      'Oyeladun Olugbenga Phillp',
      'Mobile App Developer');

  TextEditingController nameController = TextEditingController();
  TextEditingController stackController = TextEditingController();
  TextEditingController slackController = TextEditingController();
  TextEditingController githubController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController aboutController = TextEditingController();

  bool editings = false;

  @override
  void initState() {
    super.initState();
    nameController.text = details.name;
    stackController.text = details.stack;
    slackController.text = details.slackname;
    githubController.text = details.github;
    emailController.text = details.email;
    aboutController.text = details.about;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        toolbarHeight: 35,
        backgroundColor: Colors.black,
        title: editings
            ? const Text(
                'Edit Your Cv',
                style: TextStyle(fontSize: 15),
              )
            : const Text('My Cv'),
        actions: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (editings) {
                  details.name = nameController.text;
                  details.stack = stackController.text;
                  details.slackname = slackController.text;
                  details.github = githubController.text;
                  details.about = aboutController.text;
                  details.email = emailController.text;
                }
                editings = !editings;
              });
            },
            child: editings
                ? Text(
                    'Update',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  )
                : Text(
                    'Edit',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
          ),
        ],
      ),
      body: editings ? Edit_Page() : View_Page(),
    );
  }

  Widget View_Page() {
    return ListView(padding: const EdgeInsets.all(15), children: [
      Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/abc.jpg'),
                radius: 50,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 227,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      details.name,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      details.stack,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                    Text(
                      details.email,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'ABOUT',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            details.about,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'SLACK NAME',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            details.slackname,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'GITHUB USERNAME',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            details.github,
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      )
    ]);
  }

  Widget Edit_Page() {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: [
        ListTile(
          subtitle: Textfields(
            nameController: nameController,
            label: 'Enter your name',
          ),
        ),
        SizedBox(
          height: 15,
        ),
        ListTile(
          subtitle: Textfields(
            nameController: stackController,
            label: 'Enter your stacks',
          ),
        ),
        SizedBox(
          height: 15,
        ),
        ListTile(
          subtitle: Textfields(
            nameController: emailController,
            label: 'Enter your email address',
          ),
        ),
        SizedBox(
          height: 15,
        ),
        ListTile(
          subtitle: Textfields(
            nameController: aboutController,
            label: 'Enter somethings about you',
          ),
        ),
        SizedBox(
          height: 15,
        ),
        ListTile(
          subtitle: Textfields(
            nameController: slackController,
            label: 'Enter your slack name',
          ),
        ),
        SizedBox(
          height: 15,
        ),
        ListTile(
          subtitle: Textfields(
            nameController: githubController,
            label: 'Enter your Github name',
          ),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

class Textfields extends StatelessWidget {
  const Textfields(
      {super.key, required this.nameController, required this.label});

  final TextEditingController nameController;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null,
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white),
      controller: nameController,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.white),
        labelText: label,
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
      ),
    );
  }
}
