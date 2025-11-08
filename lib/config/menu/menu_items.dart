import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Botones',
    subtitle: 'Varios botones en Flutter',
    link: '/buttons',
    icon: Icons.smart_button
  ),
  MenuItem(
    title: 'Tarjetas',
    subtitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card
  ),
  MenuItem(
    title: 'Progress Indicators',
    subtitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded
  ),
  MenuItem(
    title: 'SnackBar',
    subtitle: 'Snackbars and dialogs',
    link: '/snackbar',
    icon: Icons.info_outline
  ),
  MenuItem(
    title: 'Animated container',
    subtitle: 'Stateful widget animated',
    link: '/animated',
    icon: Icons.check_box_outline_blank
  ),
  MenuItem(
    title: 'UI Controls',
    subtitle: 'Some UI controls',
    link: '/ui_controls',
    icon: Icons.car_rental_outlined
  ),
  MenuItem(
    title: 'App Tutorial',
    subtitle: 'Introduction to the App',
    link: '/app_tutorial',
    icon: Icons.accessibility_new_outlined
  ),
  MenuItem(
    title: 'Infinite Scroll',
    subtitle: 'Infinite Scroll and Scroll pull up',
    link: '/infinite_scroll',
    icon: Icons.table_rows_outlined
  ),
  MenuItem(
    title: 'Riverpod Counter',
    subtitle: 'Simple Riverpod Counter',
    link: '/counter',
    icon: Icons.plus_one_outlined
  ),
  MenuItem(
    title: 'Theme Changer',
    subtitle: 'Change current theme',
    link: '/theme_changer',
    icon: Icons.theater_comedy_rounded
  ),
];
