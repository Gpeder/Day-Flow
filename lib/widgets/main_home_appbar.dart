import 'package:dayflow/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class MainHomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const MainHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final cumprimento = DateTime.now().hour < 12 ? 'Bom dia' : 'Boa tarde';
    final nomeCompleto = 'John Doe';
    final iniciais = nomeCompleto.split(' ').map((e) => e[0]).take(2).join().toUpperCase();
    final temFoto = false;

    return AppBar(
      toolbarHeight: 80,
      title: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Theme.of(context).colorScheme.primary,
            backgroundImage: temFoto ? const AssetImage('assets/images/user_avatar.png') : null,
            child: !temFoto ? Text(
              iniciais,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ) : null,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(cumprimento, style: AppTextStyles.text16,),
              const SizedBox(height:4),
              Text(nomeCompleto, style: AppTextStyles.title20,),
            ],
          ),
        ],
      ),
      actionsPadding: EdgeInsets.only(right: 10),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Ionicons.settings_outline)),
        IconButton(
          onPressed: () {},
          icon: Icon(Ionicons.notifications_outline),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
