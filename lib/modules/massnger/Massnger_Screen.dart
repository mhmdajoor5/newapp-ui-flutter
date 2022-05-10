import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MassngeScreen extends StatelessWidget {
  const MassngeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 15.5 ,
        title:Row(
            children: const [
              CircleAvatar(
                radius: 25.5,
                backgroundImage: NetworkImage('https://media.istockphoto.com/photos/spring-crocus-flowers-picture-id1285934140?s=612x612'),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                'Chats',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.5,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),

        actions: [
          CircleAvatar(
            radius: 20.5,
            backgroundColor: Colors.blue,
            child: IconButton(onPressed: (){},
              icon: const Icon(
              Icons.camera_alt,

            ),),
          ),
          const SizedBox(
            width: 10.5,
          ),
          CircleAvatar(
            radius: 20.5,
            backgroundColor: Colors.blue,
            child: IconButton(onPressed: (){},
              icon: const Icon(
                Icons.phone,

              ),),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 20.5,
            vertical: 15.5
        ),
        child: SingleChildScrollView(
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.5),
                  color: Colors.black26,
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.5,
                      backgroundColor: Colors.white12,
                      child: IconButton(onPressed: (){},
                        icon: const Icon(
                          Icons.search,

                        ),),
                    ),
                     const Text(
                      'Serach',
                       style: TextStyle(
                         color: Colors.black,
                         fontSize: 17.5,
                       ),
                    ),
                  ],
                ),

              ),
                SizedBox(
                  height: 5.1,
                ),
                Container(

                  height: 100,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => buildStoryItem() ,
                      separatorBuilder: (context , index) => SizedBox(
                        width: 5.5,
                      ),
                      itemCount: 20,
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                ListView.separated(
                    shrinkWrap: true ,
                     physics: NeverScrollableScrollPhysics() ,
                    itemBuilder: (context, index) => buildChatItem(),
                    separatorBuilder: (context , index) => SizedBox(
                      height: 15.5,
                    ),
                    itemCount: 15 ,
                ),






            ],
          ),
        ),

      ),
    );
  }

 Widget buildStoryItem() => Container(
   width: 60.0,
   child: Column(
     children: [
       Stack(
         alignment: AlignmentDirectional.bottomEnd,
         children: const [
           CircleAvatar(
             radius: 25.6,
             backgroundImage: NetworkImage('https://media.istockphoto.com/photos/spring-crocus-flowers-picture-id1285934140?s=612x612'),
           ),
           Padding(
             padding: EdgeInsetsDirectional.only(
               bottom: 2.0,
               end: 5.5,
             ),
             child: CircleAvatar(
               radius: 5.0,
               backgroundColor:Colors.green ,
             ),
           ),
         ],
       ),
       SizedBox(
         height: 5.5,
       ),
       Text(

         'Mhmd Wael Ajoor',
         maxLines: 2,
         overflow: TextOverflow.ellipsis,

         style: TextStyle(
           color: Colors.black,
           fontSize: 15.5,

         ),
       ),
     ],
   ),
 );

 Widget buildChatItem() => Row(
   children: [
     Stack(
       alignment: AlignmentDirectional.bottomEnd,
       children: const [
         CircleAvatar(
           radius: 25.6,
           backgroundImage: NetworkImage('https://media.istockphoto.com/photos/spring-crocus-flowers-picture-id1285934140?s=612x612'),
         ),
         Padding(
           padding: EdgeInsetsDirectional.only(
             bottom: 2.0,
             end: 5.5,
           ),
           child: CircleAvatar(
             radius: 5.0,
             backgroundColor:Colors.green ,
           ),
         ),
       ],
     ),
     Expanded(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text(
             'Mhmd Wael Ajoor Mhmd Wael Ajoor Mhmd Wael Ajoor ',
             maxLines: 1,
             overflow: TextOverflow.ellipsis,
             style: TextStyle(
               color: Colors.black,
               fontSize: 16.0,
             ),
           ),
           SizedBox(
             height: 4.0,
           ),
           Row(
             children: [
               Text(
                 'Mhmd Wael Ajoor Wael Ajoor',
                 style: TextStyle(
                   color: Colors.black,
                   fontSize: 16.0,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               Padding(
                 padding: const EdgeInsetsDirectional.only(
                   start: 10.0,
                   bottom: 5.0,
                 ),
                 child: Container(
                   width: 10.0,
                   height: 10.0,
                   color: Colors.green,

                 ),
               ),
               SizedBox(
                 width: 7.5,
               ),
               Text(
                 '7:00',
                 style: TextStyle(
                   color: Colors.black,
                   fontSize: 15.5,
                 ),
               ),
             ],
           ),
         ],
       ),
     ),
   ],
 );
}
