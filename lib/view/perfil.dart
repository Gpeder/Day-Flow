import 'package:dayflow/theme/theme.dart';
import 'package:dayflow/widgets/main_card.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    final nomeCompleto = 'John Doe';
    final iniciais = nomeCompleto
        .split(' ')
        .map((e) => e[0])
        .take(2)
        .join()
        .toUpperCase();
    final temFoto = false;

    return Scaffold(
      appBar: AppBar(title: const Text('Perfil')),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          children: [
            MainCard(
              widget: ListTile(
                contentPadding: EdgeInsets.zero,
                horizontalTitleGap: 10,
                leading: CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.primary,
                  backgroundImage: temFoto
                      ? const AssetImage('assets/images/user_avatar.png')
                      : null,
                  child: !temFoto
                      ? Text(
                          iniciais,
                          style: AppTextStyles.text14.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      // ignore: dead_code
                      : null,
                ),
                title: Text(nomeCompleto, style: AppTextStyles.title20Bold),
                subtitle: Padding(
                  padding: const .only(top: 4.0),
                  child: Text(
                    'Editar profile',
                    style: AppTextStyles.text14.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: MainCard(
                    widget: Column(
                      children: [
                        Text(
                          '12',
                          style: AppTextStyles.title20Bold.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Tarefas hoje',
                          style: AppTextStyles.text14.copyWith(
                            color: AppColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  child: MainCard(
                    widget: Column(
                      children: [
                        Text('29', style: AppTextStyles.title20Bold),
                        SizedBox(height: 10),
                        Text(
                          'Total',
                          style: AppTextStyles.text14.copyWith(
                            color: AppColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            Column(
              crossAxisAlignment: .start,
              children: [
                Padding(
                  padding: const .only(left: 8.0),
                  child: Text(
                    'Conta',
                    style: AppTextStyles.text16.copyWith(
                      color: AppColors.textMuted,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                MainCard(
                  widget: Column(
                    children: [
                      ListTile(
                        horizontalTitleGap: 10,
                        contentPadding: .zero,
                        leading: Icon(Ionicons.person_outline),
                        title: Text('Configurações', style: AppTextStyles.text16),
                        trailing: Icon(Ionicons.chevron_forward),
                      ),
                      Divider(color: AppColors.textSecondary, thickness: 0.4),
                      ListTile(
                        horizontalTitleGap: 10,
                        contentPadding: .zero,
                        leading: Icon(Ionicons.mail_outline),
                        title: Text('Email e notificações', style: AppTextStyles.text16),
                        trailing: Icon(Ionicons.chevron_forward),
                      ),
                      Divider(color: AppColors.textSecondary, thickness: 0.4),
                      ListTile(
                        horizontalTitleGap: 10,
                        contentPadding: .zero,
                        leading: Icon(Ionicons.shield_outline),
                        title: Text('Segurança', style: AppTextStyles.text16),
                        trailing: Icon(Ionicons.chevron_forward),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            Column(
              crossAxisAlignment: .start,
              children: [
                Padding(
                  padding: const .only(left: 8.0),
                  child: Text(
                    'Preferências',
                    style: AppTextStyles.text16.copyWith(
                      color: AppColors.textMuted,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                MainCard(
                  widget: Column(
                    children: [
                      ListTile(
                        horizontalTitleGap: 10,
                        contentPadding: .zero,
                        leading: Icon(Ionicons.notifications_outline),
                        title: Text('Notificações', style: AppTextStyles.text16),
                        trailing: Icon(Ionicons.chevron_forward),
                      ),
                      Divider(color: AppColors.textSecondary, thickness: 0.4),
                      ListTile(
                        horizontalTitleGap: 10,
                        contentPadding: .zero,
                        leading: Icon(Ionicons.moon_outline),
                        title: Text('Aparência', style: AppTextStyles.text16),
                        subtitle: Padding(
                          padding: const .only(top: 5.0),
                          child: Text(
                            'Tema escuro',
                            style: AppTextStyles.text14.copyWith(
                              color: AppColors.textMuted,
                            ),
                          ),
                        ),
                        trailing: Icon(Ionicons.chevron_forward),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            Column(
              crossAxisAlignment: .start,
              children: [
                Padding(
                  padding: const .only(left: 8.0),
                  child: Text(
                    'Suporte',
                    style: AppTextStyles.text16.copyWith(
                      color: AppColors.textMuted,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                MainCard(
                  widget: Column(
                    children: [
                      ListTile(
                        horizontalTitleGap: 10,
                        contentPadding: .zero,
                        leading: Icon(Ionicons.help_circle_outline),
                        title: Text('Ajuda', style: AppTextStyles.text16),
                        trailing: Icon(Ionicons.chevron_forward),
                      ),
                      Divider(color: AppColors.textSecondary, thickness: 0.4),
                      ListTile(
                        horizontalTitleGap: 10,
                        contentPadding: .zero,
                        leading: Icon(Ionicons.information_circle_outline),
                        title: Text('Sobre', style: AppTextStyles.text16),
                        subtitle: Padding(
                          padding: const .only(top: 5.0),
                          child: Text(
                            'Versão 1.0.0',
                            style: AppTextStyles.text14.copyWith(
                              color: AppColors.textMuted,
                            ),
                          ),
                        ),
                        trailing: Icon(Ionicons.chevron_forward),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.error
                    ),
                    onPressed: () {},
                    child: Text('Sair'),
                    ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
