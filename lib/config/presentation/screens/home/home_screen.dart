import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter + Material 3'),),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final item = appMenuItems[index];

        return _CustomListTile(item: item);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  
  const _CustomListTile({
    super.key,
    required this.item,
  });

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(item.icon, color: colors.primary,),
      trailing: Icon(Icons.arrow_forward_ios_rounded,color: colors.primary),
      title: Text(item.title),
      subtitle: Text(item.subtitle),
      onTap: ()  {
        // Navigator.pushNamed(context, item.link);
        context.push(item.link);
      },
    );
  }
}