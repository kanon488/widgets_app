import 'package:flutter/material.dart';

class  MenuItem {
final String title;
final String subtitle;
final String link;
final IconData icon ;

const MenuItem({
required this.title,
required this.subtitle,
required this.link,
required this.icon
});
}


const appMenuItems = <MenuItem>[
  
  MenuItem(title: 'Counter state riverpod',
           subtitle: 'Primer acercamiento',
            link: '/counter-riverpod',
            icon: Icons.storage),
    MenuItem(title: 'Theme changer', 
    subtitle: 'Select a new theme to be applied', 
    link: '/theme-changer', 
    icon: Icons.catching_pokemon_rounded),
    MenuItem(
    title: 'Botones',
    subtitle: 'Varios botones en flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined
  ), 
  MenuItem(
    title: 'Tarjetas', 
    subtitle: 'Un contenedor estilizado', 
    link: '/cards', 
    icon: Icons.credit_card),
    MenuItem(
      title: 'Progress Indicators', 
      subtitle: 'Generales y controlados', 
      link: '/progress', 
      icon: Icons.refresh_rounded),
      MenuItem(
        title: 'Snackbar y dialogos', 
        subtitle: 'Indicadores en pantalla', 
        link: '/snackbars', 
        icon: Icons.info_outline),
        MenuItem(title: 'Animated Container',
        subtitle: 'Container animado', 
        link: '/animated',
        icon: Icons.check_box_outline_blank_rounded),
        MenuItem(
          title: 'UI Controls + Tiles',
          subtitle: 'Serie de controles en flutter',
          link: '/ui-controls',
          icon: Icons.car_rental_outlined),
        MenuItem(
          title: 'Tutorial',
          subtitle: 'Introducción de la app',
          link: '/tutorial',
          icon: Icons.accessible_rounded),
        MenuItem(
          title: 'Infinite Scroll and Pull',
          subtitle: 'Listas inifinas y pull to request',
          link: '/infinite',
          icon: Icons.list_alt_rounded),
];