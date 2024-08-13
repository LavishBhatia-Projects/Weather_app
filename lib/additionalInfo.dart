import 'package:flutter/material.dart';

class Aditionalinfo extends StatelessWidget {
  final IconData Micons;
  final String label;
  final String value;
  const Aditionalinfo({
    super.key,
    required this.Micons,
    required this.label,
    required this.value
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Icon(
            Micons,
            weight: 20,size:40 ),
        const SizedBox(height: 10,),

        Text(label,style:const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400

        ))
        ,
        const SizedBox(height: 10,),

        Text(value,style:const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400

        ))

      ],
    );
  }
}