import 'package:dayflow/components/home/listatarefas.dart';
import 'package:dayflow/components/home/titulo.dart';
import 'package:dayflow/widgets/main_home_appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainHomeAppbar(),
      body: Padding(
        padding: .symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            SizedBox(height: 10),
            TituloHomePage(),
            SizedBox(height: 10),
            ListaTarefas(),
          ],
        ),
      ),
    );
  }
}


