import 'package:flutter/material.dart';

enum Destination {
  releases(label: 'Releases', icon: Icons.new_releases),
  top(label: 'Top', icon: Icons.star),
  chart(label: 'Chart', icon: Icons.pie_chart);

  const Destination({
    required this.label,
    required this.icon,
  });

  final String label;
  final IconData icon;

  NavigationDestination get _navigationBarItem => NavigationDestination(
        icon: Icon(icon),
        label: label,
      );

  NavigationRailDestination get _navigationRailItem =>
      NavigationRailDestination(
        icon: Icon(icon),
        label: Text(label),
      );

  static List<NavigationDestination> get navigationBarItems =>
      Destination.values.map((e) => e._navigationBarItem).toList();

  static List<NavigationRailDestination> get navigationRailItems =>
      Destination.values.map((e) => e._navigationRailItem).toList();

  static List<Widget> get listViewItems => Destination.values
      .map((e) => GestureDetector(
            onTap: () {},
            child: InkWell(
              onTap: () {},
              child: Row(
                children: [Icon(e.icon), Text(e.label)],
              ),
            ),
          ))
      .toList();
}
