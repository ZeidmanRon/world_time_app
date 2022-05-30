import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  void getData() async {
    //simulating network request for data
    String username = await Future.delayed(const Duration(seconds: 2), () {
      return ('some_name');
    });

    String bio = await Future.delayed(const Duration(seconds: 1), () {
      return ('very interesting bio');
    });

    print(username + ', ' + bio);
  }

  @override
  void initState() {
    super.initState();
    getData();
    print('hey');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: MaterialButton(
        onPressed: () {
          setState(() {});
        },
        child: Text('count'),
      ),
    );
  }
}
