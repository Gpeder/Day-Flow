import 'package:flutter/material.dart';

class Tarefas extends StatelessWidget {
  const Tarefas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
      ),
      body: const Center(
        child: Text('Página de Tarefas'),
      ),
    );
  }
}