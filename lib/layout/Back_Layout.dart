import 'package:flutter/material.dart';
import 'package:udemy_flutter/modules/smoke_screen/somke_screen.dart';
import 'package:udemy_flutter/modules/task_screen/task_screen.dart';

class BackLayout extends StatefulWidget {
  const BackLayout({Key? key}) : super(key: key);

  @override
  State<BackLayout> createState() => _BackLayoutState();
}

class _BackLayoutState extends State<BackLayout> {

  int currentIndex = 0;

  List<Widget> Screen = [
    taskScreen(),
    somkeScreen(),
  ];

  List<String> Title = [
    'Task App',
    'Done App',
    'Somke App',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Title[currentIndex],
        ),

      ),
      body: Screen[currentIndex] ,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black54,
          currentIndex: currentIndex,
          onTap: (index){
          setState(() {
            currentIndex = index;
          });
          },

          items:[
            BottomNavigationBarItem(
                icon: Icon(Icons.archive),
                label: 'Task',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.accessible_forward_rounded),
              label: 'Done',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.smoke_free),
              label: 'smoke',
            )
          ],
      ),
    );
  }
}




