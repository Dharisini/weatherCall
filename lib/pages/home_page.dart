import 'package:flutter/material.dart';
import 'package:weather_app/pages/weather_deatil.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  /////////////cursor will not appear untill u start typing
  late final TextEditingController _controller;
  //dissable the button when text field is empty
  bool _isCityNameEmpty = true;

  @override
  void initState() {
    //initstate is a lifecycle
    //when state is created for the first time
    //controler helps to handle the input

    super.initState();

    _controller = TextEditingController();

    _controller.addListener(() {
      //can see at controller every input at the terminal

      setState(() => _isCityNameEmpty = _controller.text.isEmpty);
    });
    print(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search city"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Please enter city name',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ), // adding some sizing to the text
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  //text field controller is added here
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Enter City Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('Search'),
                onPressed: _isCityNameEmpty
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                WeatherDetail(cityName: _controller.text),
                            //taking input and going to another page
                          ),
                        );
                      },
                //if true execute the first part then false execute the second part
              )
            ]),
      ),
    );
  }
}
