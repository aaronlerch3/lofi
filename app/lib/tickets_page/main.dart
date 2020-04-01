import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tickets extends StatefulWidget {
  @override
  _TicketsState createState() => _TicketsState();
}

class _TicketsState extends State<Tickets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Tickets'),
      backgroundColor: Color(0xFFF7F3E3),
    );
  }
}
