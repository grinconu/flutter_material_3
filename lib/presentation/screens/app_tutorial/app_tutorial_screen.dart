import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String description;
  final String imageUrl;

  SlideInfo(this.title, this.description, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
    'Welcome to the App',
    'This is the first slide',
    'assets/images/1.png',
  ),
  SlideInfo(
    'Fast Delivery',
    'Reprehenderit adipisicing adipisicing occaecat consequat quis ea amet tempor id elit irure non eu non.',
    'assets/images/2.png',
  ),
  SlideInfo(
    'Enjoy your meal',
    'Adipisicing qui est velit laborum tempor ut reprehenderit.',
    'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController _pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    _pageViewController.addListener(() {
      final page = _pageViewController.page ?? 0;
      if (!endReached && page >= slides.length - 1.5) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides.map((slide) => _Slide(slide: slide)).toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(),
              child: Text('Skip'),
            ),
          ),

          endReached
              ? Positioned(
                  right: 30,
                  bottom: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(milliseconds: 500),
                    child: FilledButton(
                      onPressed: () => context.pop(),
                      child: const Text('Start'),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final SlideInfo slide;

  const _Slide({required this.slide});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(slide.imageUrl)),
            const SizedBox(height: 10),
            Text(slide.title, style: titleStyle),
            const SizedBox(height: 10),
            Text(slide.description, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
