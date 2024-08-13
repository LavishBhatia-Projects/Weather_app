import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HourlyForecast extends StatelessWidget{
  final String time;
  final IconData icon;
  final String temp;
  const HourlyForecast({super.key,
  required this.time,
    required this.icon,
    required this.temp
  }
      );


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation:10,
      child: Container(
        width: 130,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(time, style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Icon(icon, size: 32,weight: 22,),
                const SizedBox(
                  height: 20,
                ),
                Text(temp, style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}