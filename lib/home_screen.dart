import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  PageController? _pageController;

  AnimationController? _rippileController;
  AnimationController? _scaleController;

  Animation<double>? _rippileAnimation;
  Animation<double>? _scaleAnimation;


  @override
  void initState() {
    super.initState();

    _pageController=PageController(
      initialPage: 0
    );

    _rippileController=AnimationController(
      vsync: this,
      duration: Duration(seconds: 1)
    );

    _scaleController=AnimationController(
        vsync: this,
        duration: Duration(seconds: 1)
    );

    _rippileAnimation=Tween(
      begin: 80.0,
      end: 90.0
    ).animate(_rippileController!)..addStatusListener((status){
      if(status==AnimationStatus.completed){
        _rippileController?.reverse();
      }
      else if(status==AnimationStatus.dismissed){
        _rippileController?.forward();
      }
    });

    _scaleAnimation=Tween(
        begin: 1.0,
        end: 30.0
    ).animate(_scaleController!);

    _rippileController?.forward();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          Container(
            decoration: BoxDecoration(
              // image: DecorationImage(
              //   image: AssetImage('assets/images/one.jpg'),
              //   fit: BoxFit.cover
              // )
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.3),
                  ],
                )
              ),
              child: Padding(
                padding: EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60,),
                    Text('Exercise 1',style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),),
                    SizedBox(height: 40,),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('15',style: TextStyle(
                            color: Colors.yellow[400],
                            fontWeight: FontWeight.bold,
                            fontSize: 30
                        ),),
                        Text('Minutes',style: TextStyle(
                            color: Colors.white,
                            fontSize: 30
                        ),),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('3',style: TextStyle(
                            color: Colors.yellow[400],
                            fontWeight: FontWeight.bold,
                            fontSize: 30
                        ),),
                        Text('Exercise',style: TextStyle(
                            color: Colors.white,
                            fontSize: 30
                        ),),
                        SizedBox(height: 100,),
                        Align(
                          child: Text('Start the morning with your health',textAlign: TextAlign.center,style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                          ),),
                        ),
                        SizedBox(height: 30,),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: AnimatedBuilder(
                            animation: _scaleAnimation!,
                            builder: (context,child)=> Transform.scale(
                              scale: _scaleAnimation!.value,
                              child: Container(
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue
                                ),
                              ),
                            ),
                          )
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }


}
