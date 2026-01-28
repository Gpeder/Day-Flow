import 'package:dayflow/components/home/titulo.dart';
import 'package:dayflow/theme/theme.dart';
import 'package:dayflow/widgets/main_checkbox.dart';
import 'package:dayflow/widgets/main_chip.dart';
import 'package:dayflow/widgets/main_home_appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const categorias = [
    'Todas',
    'Trabalho',
    'Saúde',
    'Pessoal',
    'Estudos',
    'Outros',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainHomeAppbar(),
      body: SingleChildScrollView(
        padding: .symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            SizedBox(height: 10),
            TituloHomePage(),
            SizedBox(height: 10),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categorias.length,
                separatorBuilder: (context, index) => SizedBox(width: 8),
                itemBuilder: (context, index) {
                  return MainChip(
                    label: categorias[index],
                    selected: index == 0,
                    onTap: () {},
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Container(
                width: 5,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text('Call com o time', style: AppTextStyles.text18Bold),
              ),
              subtitle: Text(
                'Trabalho -  14:00',
                style: AppTextStyles.text14.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
              trailing: AppCheckbox(value: true, onChanged: (v) {}),
            ),
          ],
        ),
      ),
    );
  }
}
