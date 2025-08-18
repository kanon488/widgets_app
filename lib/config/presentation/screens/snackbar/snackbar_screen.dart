import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({
    super.key
  });
  
  void showCustomSnackbar(BuildContext context)
  {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(content: Text('Hola mundo'),
    action: SnackBarAction(
      label: 'OK', 
      onPressed: (){}),);

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context){
    showDialog(context: context,
    barrierDismissible: false,
     builder: (context)=> AlertDialog(
      title: Text('¿Estas seguro?'),
      content: Text('Loremp ipsum dolor asimet cha la la la rola lala asu xmet avengers'),
      actions: [
        TextButton(onPressed: () => context.pop(), child: Text('Cancelar')),
        FilledButton(onPressed: () => context.pop(), child: Text('Aceptar'))
      ],
     ));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Snackbar y dialogos')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           FilledButton.tonal(onPressed: (){
            showAboutDialog(context: context,
            children: [Text('Lorepm ipson solor asime solor asimet dolor asimet loremp dolor asimet dolor asimet ')]);
           }, child: Text('Licencias usadas')),
           FilledButton.tonal(onPressed: (){
            openDialog(context);
           }, child: Text('Mostrar dialogo')) 
        ],),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Mostrar snackbar'),
        icon: Icon(Icons.remove_red_eye_outlined),
        onPressed: (){
          showCustomSnackbar(context);
        } ,
        ),
      );
  }
}