import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
home: WeatherScreen(), );
}
}

class WeatherScreen extends StatefulWidget {
@override

_WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
String weatherInfo = 'Pressthe button to get weather info';

void fetchWeather() async {
final response = await
http.get(Uri.parse('https://api.weatherapi.com/v1/current.json?key=YOUR_API_KEY&q=London'));

if (response.statusCode == 200) {
var data = jsonDecode(response.body);
setState(() {
weatherInfo = 'Weather in London: ${data['current']['temp_c']}°C';
});
} else {
setState(() {
weatherInfo = 'Failed to fetch weather data';
});
}
}

@override
Widget build(BuildContext context) {
return Scaffold(

appBar: AppBar(title: Text('Weather App')), body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center, children: [
Text(weatherInfo, textAlign: TextAlign.center), SizedBox(height: 20), ElevatedButton(
onPressed: fetchWeather, child: Text('Get Weather'), ), ], ), ), );
}
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}