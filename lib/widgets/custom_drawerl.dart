import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int selectedIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
        const ListTile(leading: Icon(Icons.home_outlined,),
        title: Text('homeeeeee'),),
    

        ],
      ),
        );
  }
}
