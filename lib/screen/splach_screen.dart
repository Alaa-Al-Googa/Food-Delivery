import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  PageController _controller = PageController();
  int currentPage = 0;

  List<String> images = [
    'assets/images/image 1.png',
    'assets/images/image 1.png',
    'assets/images/image 1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: images.length,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(images[index], fit: BoxFit.cover),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(46), // انحناء كبير
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'We serve\nincomparable\ndelicacies',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 33,
                          fontWeight: FontWeight.bold,
                          height: 1.4,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "All the best restaurants with their top\nmenu waiting for you, they can't wait\nfor your order!",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: currentPage == images.length - 1
                            ? MainAxisAlignment
                                  .center // الزر بالنص في الصفحة الأخيرة
                            : MainAxisAlignment
                                  .spaceBetween, // توزيع عادي في باقي الصفحات
                        children: [
                          // فقط لو مش بالصفحة الأخيرة، اعرض زر Skip
                          if (currentPage != images.length - 1)
                            TextButton(
                              onPressed: () {
                                _controller.jumpToPage(images.length - 1);
                              },
                              child: Text(
                                "Skip",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),

                          // الزر الأخير (Go) أو زر Next
                          currentPage == images.length - 1
                              ? Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      context.go('/login');
                                    },
                                    child: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.orange,
                                    ),
                                  ),
                                )
                              : TextButton(
                                  onPressed: () {
                                    _controller.nextPage(
                                      duration: Duration(milliseconds: 500),
                                      curve: Curves.ease,
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        "Next",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(width: 5),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildDot(bool isSelected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: isSelected ? 20 : 10,
      height: 8,
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.white54,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
