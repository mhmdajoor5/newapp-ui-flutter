  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

  class HomeScreen extends StatelessWidget{

    List<int> i = [1,2,3,];

    @override
    Widget build(BuildContext context) {

      return Scaffold (
        appBar: AppBar(
          backgroundColor:Colors.teal,
          leading:
          Icon(
            Icons.mail_sharp,
          ),

          title: Text(
            'First Project'
          ),
          centerTitle: true,
          elevation: 0.0,
          automaticallyImplyLeading: true,
            actions: [
              IconButton(
                icon:Icon(
                  Icons.notifications_active_outlined,
                ) ,
                onPressed:()
                {
                  print('hello');
                } ,
              ),

                 IconButton(
                  icon : Icon(Icons.no_encryption_rounded
                  ),

                onPressed: (){
                  print('Mhmd Wael');
                },
      ),


            ],





        ),
        body: Column(
          children: [
            Container(
              width: 200.5,

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
               decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22.5,),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image(
                        image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg"
                        ),
                        width: 200.5,
                        height: 200.5,
                        fit: BoxFit.cover,
                      ),
                      Container(

                        color: Colors.black.withOpacity(.7),
                        width: 200.5,
                        padding: const EdgeInsets.symmetric(
                          vertical: 10.5,
                          horizontal: 20.5,


                        ),

                        child: Text(
                          'first Stack',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20.5,
                                color: Colors.white,


                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),


      );
    }

  }
