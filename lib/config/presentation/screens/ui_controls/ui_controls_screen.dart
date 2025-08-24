import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UI Controls')),
      body: _UIControlsView(),
    );
  }
}

class _UIControlsView extends StatefulWidget {
  const _UIControlsView();
  @override
  State<_UIControlsView> createState() => _UIControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UIControlsViewState extends State<_UIControlsView> {
  bool isDeveloper = true;
  Transportation selectedTrasportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: Text('Developer Mode'),
          subtitle: Text('Controles adicionales'),
          value: isDeveloper,
          onChanged:
              (value) => setState(() {
                isDeveloper = !isDeveloper;
              }),
        ),
        ExpansionTile(
          title: Text('Tipo de transporte'),
          subtitle: Text('$selectedTrasportation'),
          children: [
            RadioListTile(
              title: Text('By car'),
              subtitle: Text('Viajando por auto'),
              value: Transportation.car,
              groupValue: selectedTrasportation,
              onChanged:
                  (value) => setState(() {
                    selectedTrasportation = Transportation.car;
                  }),
            ),
            RadioListTile(
              title: Text('By plane'),
              subtitle: Text('Viajando por avion'),
              value: Transportation.plane,
              groupValue: selectedTrasportation,
              onChanged:
                  (value) => setState(() {
                    selectedTrasportation = Transportation.plane;
                  }),
            ),
            RadioListTile(
              title: Text('By boat'),
              subtitle: Text('Viajando por barco'),
              value: Transportation.boat,
              groupValue: selectedTrasportation,
              onChanged:
                  (value) => setState(() {
                    selectedTrasportation = Transportation.boat;
                  }),
            ),
            RadioListTile(
              title: Text('By submarine'),
              subtitle: Text('Viajando por submarino'),
              value: Transportation.submarine,
              groupValue: selectedTrasportation,
              onChanged:
                  (value) => setState(() {
                    selectedTrasportation = Transportation.submarine;
                  }),
            ),
          ],
        ),
        CheckboxListTile(
          title: Text('¿Incluir desayuno?'),
          subtitle: Text('¿Desea incluirlo?'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          })),
          CheckboxListTile(
          title: Text('¿Incluir almuerzo?'),
          subtitle: Text('¿Desea incluirlo?'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          })),
          CheckboxListTile(
          title: Text('¿Incluir cena?'),
          subtitle: Text('¿Desea incluirla?'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }))
      ],
    );
  }
}
