

import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/secrets.dart';
import 'additionalInfo.dart';
import 'package:http/http.dart' as http;

class weatherscreen extends StatefulWidget{
  const weatherscreen({super.key});

  @override
  State<weatherscreen> createState() => _weatherscreenState();
}

class _weatherscreenState extends State<weatherscreen> {
  double temp=0;
  double usedtemp=0;
  double tempUse=0;
  String currentsky='';
  String pressure='';
  String windspeed='';
  String Humidity='';
  String Data='';
  String cityname = 'Chandigarh';
  bool isloading=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentWeather();
  }

  Future getCurrentWeather() async {
    setState(() {
      isloading=true;
    });
    try {
      final res = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityname&APPID=$apikey'),

      );
      final data = jsonDecode(res.body);
      final cod=data['cod'];
      setState(() {
        temp=data['list'][0]['main']['temp'];
        usedtemp=temp-273;
        tempUse=roundDouble(usedtemp, 2);
        currentsky=data['list'][0]['weather'][0]['main'];
        pressure=data['list'][0]['main']['pressure'].toString();
        windspeed=data['list'][0]['wind']['speed'].toString();
        Humidity=data['list'][0]['main']['humidity'].toString();
        isloading=false;
      });




    }
    catch (e) {
      setState(() {
        isloading=false;
      });
    }
  }



@override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Weather Forecast',
        style: TextStyle(
          fontWeight: FontWeight.bold

        ),
        ),
        centerTitle: true,
        actions:  [
          IconButton(
            onPressed: () async {
              await getCurrentWeather();

            },
            icon: const Icon(Icons.refresh),
          ),

        ],
      ),
          body: isloading ? const LinearProgressIndicator(color: Colors.red,backgroundColor: Colors.black87,):  Padding(
            padding:  const EdgeInsets.all(16.0),
            child:  Column(
                    children: [
            SizedBox(
              width: double.infinity,
              child: Card(

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
                ),
                elevation: 10,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX:10,sigmaY: 10 ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [

                          Text('$tempUse °C',style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold
                          ),),
                          const SizedBox(height: 16,),
                          Icon(currentsky=='Clouds'? Icons.cloud : currentsky=='Rain'? Icons.thunderstorm : Icons.sunny, size: 60,),
                          const SizedBox(height: 16,),
                           Text(currentsky,style:const  TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600
                          ),)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50,),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Expanded(
                   child: Text('Above information is about City $cityname', style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                   
                                   ),
                                   textAlign: TextAlign.center,),
                 ),
              ],
            ),

            const SizedBox(height: 40),
                      const Row(
                        textDirection: TextDirection.ltr,
                        children: [
                          Text('Additional Information', style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold

                          ),
                            textAlign: TextAlign.start,),
                        ],
                      ),
                      const SizedBox(height: 16),
                     Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Aditionalinfo(Micons: Icons.water_drop,label: 'Humidity',value:Humidity,),
                          Aditionalinfo(Micons: Icons.air,label: 'Wind Speed',value: windspeed,),
                          Aditionalinfo(Micons: Icons.beach_access,label: 'Pressure',value: pressure,),

                        ],
                      )


                  ],
                ),
          ),
    );

  }
}
double roundDouble(double value, int places){
  num mod = pow(10.0, places);
  return ((value * mod).round().toDouble() / mod);
}
