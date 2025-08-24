import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlidesInfo{
  final String title;
  final String caption;
  final String imageUrl;

  SlidesInfo(
     this.title,
     this.caption,
     this.imageUrl 
  );
}



final slides = <SlidesInfo>[
  SlidesInfo('Busca la comida', 'Ipsum cillum eu duis deserunt qui labore Lorem in.', 'assets/images/1.png'),
  SlidesInfo('Entrega rapida', 'Ipsum cillum eu duis deserunt qui labore Lorem in.', 'assets/images/2.png'),
  SlidesInfo('Disfruta tu comida', 'Ipsum cillum eu duis deserunt qui labore Lorem in.', 'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'app_tutorial_screen';
  const AppTutorialScreen({
    super.key
  });

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageviewController = PageController();
  bool finDelSlider = false;
  
  @override
  void initState() {
    super.initState();
    pageviewController.addListener((){
      final page = pageviewController.page ?? 0;
      if(!finDelSlider && page >= (slides.length - 1.5)){
        setState(() {
          finDelSlider = true;
        });
      }
    });
  }
  @override
  void dispose(){
    pageviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: BouncingScrollPhysics(),
            children: slides.map((slideData) => _Slide(
              title: slideData.title,
              caption: slideData.caption, 
              imageUrl: slideData.imageUrl)).toList(),
          ),
        Positioned(
          right: 20,
          top: 50,
          child: 
        TextButton(onPressed: () => context.pop(),
         child: Text('Salir'))),
         finDelSlider ? Positioned(
          bottom: 30,
          right: 30,
          child: FadeInRight(
            from: 15,
            delay: const Duration(seconds: 1),
            child: FilledButton(
            onPressed: (){},
                     child: Text('Comenzar')),
          )) : SizedBox()
        ],
      ),
    );
  }
}


class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl
  });

  @override
  Widget build(BuildContext context) {
    
   final titleStyle = Theme.of(context).textTheme.titleLarge;
   final captionStyle = Theme.of(context).textTheme.titleMedium;   


    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20,),
            Text(title,style: titleStyle),
            SizedBox(height: 10,),
            Text(caption,style: captionStyle,)
          ],
        ),
      ),
    );
  }
}