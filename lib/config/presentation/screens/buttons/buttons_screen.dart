import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
class ButtonsScreen extends StatelessWidget {

  static const String name = 'buttons_screen';
  const ButtonsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buttons')),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: (){
          context.pop();
        }
        ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return  SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        child: Wrap(
          spacing: 10,
          crossAxisAlignment:  WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: (){}, child: Text('Elevated')),
            ElevatedButton(onPressed: null, child: Text('Disabled')),
            ElevatedButton.icon(onPressed: (){}, icon: const Icon(Icons.camera_alt), label: Text('Elevated Icon')),
            FilledButton(onPressed: (){}, child: Text('Filled')),
            FilledButton.icon(onPressed: (){},icon: Icon(Icons.accessibility_new), label: Text('Filled Icon')),
            OutlinedButton(onPressed: (){}, child: Text('Outline')),
            OutlinedButton.icon(onPressed: (){},icon: Icon(Icons.terminal), label: Text('Outline Icon')),
            TextButton(onPressed: (){}, child: Text('Text')),
            TextButton.icon(onPressed: (){},icon: Icon(Icons.account_box_outlined), label: Text('Text Icon')),
             CustomButton(),
            IconButton(onPressed: (){}, icon: Icon(Icons.app_registration_rounded)),
            IconButton(onPressed: (){}, icon: Icon(Icons.app_registration_rounded),
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(colors.primary),
              iconColor: WidgetStatePropertyAll(Colors.white)
              ))
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget{
  CustomButton({ super.key});
  
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
      color: colors.primary,
        child: InkWell(
          onTap: (){},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Hola mundo', style: TextStyle(color: Colors.white),)),
        ),
      ),
    );
  }

  
}