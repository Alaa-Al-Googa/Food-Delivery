import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<String> images = [
    'assets/images/image 1.png',
    'assets/images/image 1.png',
    'assets/images/image 1.png',
  ];

  void _nextPage() {
    if (_currentPage < 2) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _skip() {
    _controller.animateToPage(
      2,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  Widget _buildPageContent(String image, bool isLastPage) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(image, fit: BoxFit.cover),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.all(30),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            decoration: BoxDecoration(
              color: const Color(0xFFFE8C00),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "We serve\nincomparable\ndelicacies",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "All the best restaurants with their top\nmenu waiting for you, they can't wait\nfor your order!!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 15),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index
                            ? Colors.white
                            : Colors.transparent,
                        border: Border.all(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                isLastPage
                    ? GestureDetector(
                        onTap: () {
                          context.go('/login');
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: CircularProgressIndicator(
                                value: 0.70,
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                                backgroundColor: Colors.white.withOpacity(0.3),
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.arrow_forward,
                                color: Color(0xFFFE8C00),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: _skip,
                            child: const Text(
                              "Skip",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          TextButton(
                            onPressed: _nextPage,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text(
                                  "Next",
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(width: 5),
                                Icon(Icons.arrow_forward, color: Colors.white),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: 3,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) =>
            _buildPageContent(images[index], index == 2),
      ),
    );
  }
}
