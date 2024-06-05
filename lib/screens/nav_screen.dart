import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube_clone/widgets.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final screens=[
    // HomeScreen(),
    const Scaffold(body: Center(child: Text('Explore'),),),
    const Scaffold(body: Center(child: Text('Add'),),),
    const Scaffold(body: Center(child: Text('Explore'),),),
    const Scaffold(body: Center(child: Text('Subscriptions'),),),
    const Scaffold(body: Center(child: Text('Library'),),),
  ];

  @override
  Widget build(BuildContext context) {
    bool isLarge = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(),
      drawer:  Drawer(
        child: ListView(
          children: [
           Padding(
             padding: const EdgeInsets.only(top:66,left:8.0),
             child: GestureDetector(
               child: const ListTile(
                leading: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.home_outlined,
               
                  ),
                ),
                title: Text('Home'),
               ),
             ),
           ),
          ],
        ),

            
            ),
            body: Consumer(builder: (context, ref, child) => screens[ref.watch(selectedindexProvider)],)
          ,
      bottomNavigationBar:
          !isLarge ? const CustomBottomNavigationBar():null ,
    );
  }
}
