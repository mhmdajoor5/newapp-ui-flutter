import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:udemy_flutter/modules/shop_app/login/shop_login_screen.dart';
import 'package:udemy_flutter/shared/components/components.dart';
import 'package:udemy_flutter/shared/network/local/shared_preferences.dart';
import 'package:udemy_flutter/shared/styles/colors.dart';

class BoardingModel{
  final String? image;
  final String? title;
  final String? body;

  BoardingModel({
    @required this.image,
    @required this.body,
    @required this.title,
});
}

class OnBoardingScreen extends StatefulWidget {

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(
        image:('assets/imges/OnBoarding.jpg') ,
        body: 'On Boarding body',
        title:'On Boarding title',
    ),
    BoardingModel(
        image:('assets/imges/OnBoarding2.jpg'),
        body: 'On Boarding body2' ,
        title: 'On Boarding title2'
    ),
    BoardingModel(
        image:('assets/imges/OnBoarding3.jpg'),
        body: 'On Boarding body3' ,
        title: 'On Boarding title3'
    ),
  ];

  bool isLast = false;

  void submit(){
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if(value){
        navigateAndFinish(context, LoginScreenShop());
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    var boardController  = PageController();

    return Scaffold(
      appBar: AppBar(
        actions: [

          defaultTextButton(
              function: submit ,
     text: 'Skip')

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                  physics: BouncingScrollPhysics(),

                  itemBuilder: (context , index) => defaultBoardingItem(boarding[index]),
                  itemCount: boarding.length,
                 onPageChanged: (int index){
                   if(index == boarding.length - 1){
                     setState(() {
                       isLast =true;
                     });
                   }else{
                     setState(() {
                       isLast = false;
                     });
                  }
                 },
              ),

            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [

                SmoothPageIndicator(
                    controller: boardController,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: defaultColor,
                      dotHeight: 10,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5.0,
                    ),
                    count:boarding.length ),
                Spacer(),
                FloatingActionButton(
                  onPressed: (){
                    if(isLast){
                      isLast = true;
                      submit();
                    }else{
                      isLast= false;
                      boardController.nextPage(
                          duration: Duration(
                              milliseconds: 750
                          ),
                          curve: Curves.fastLinearToSlowEaseIn);

                    }
                     },
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ) ,
    );
  }

  Widget defaultBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment:CrossAxisAlignment.start,
    children: [
      Expanded(child: Image(image: AssetImage('${model.image}'))),
      SizedBox(
        height: 30.0,
      ),
      Text('${model.title}',
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
      Text('${model.body}',
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}
