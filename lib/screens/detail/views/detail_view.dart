import 'package:blocdictionarysapp/screens/home/model/word_response.dart';
import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  final String lw;
  const DetailView({Key? key, required this.lw}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(lw),
      appBar: AppBar(
        title: const Text('detail view'),
      ),
    );
  }
}
