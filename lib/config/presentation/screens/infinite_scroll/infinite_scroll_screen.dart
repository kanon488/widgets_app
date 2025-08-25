import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const name = 'infinite_scroll_screen';
  const InfiniteScrollScreen({
    super.key
  });

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1,2,3,4,5];  

  final ScrollController scrollControler = ScrollController();
  bool isLoading = false;
  bool isMounted = true;
 @override
  void initState()
  {
    super.initState();
    scrollControler.addListener((){
      if((scrollControler.position.pixels + 500) >= scrollControler.position.maxScrollExtent){
        //load next page
        loadNextPage();
      }
    });
  }

  Future loadNextPage() async {

    if(isLoading) return;

    isLoading = true;
    setState(() {
    });

    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading= false;
    //todo revisar si esta montado el componente/widget
    if(!isMounted) return;
    setState(() {
    });
    
    moveScrollToBottom();
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {
      
    });

    await Future.delayed(Duration(seconds: 3));
    if(!isMounted) return;

    isLoading = false;
    final lastId = imagesIds.last;
    imagesIds.clear();
    
    imagesIds.add(lastId +1);
    addFiveImages();
    
    setState(() {});
    
  }

  void moveScrollToBottom(){
    if((scrollControler.position.pixels + 150) <= scrollControler.position.maxScrollExtent) return;

    scrollControler.animateTo(
      scrollControler.position.pixels +120, 
      duration: Duration(microseconds: 300),
      curve: Curves.fastOutSlowIn);
  }

 @override 
 void dispose(){ 
  scrollControler.dispose();
  isMounted = false;
  super.dispose();
 }
  void addFiveImages(){
    final lasId = imagesIds.last;

    imagesIds.addAll(
      [1,2,3,4,5].map((e) => lasId+e)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          edgeOffset: 15,
          strokeWidth: 2,
          onRefresh: onRefresh,
          child: ListView.builder(
            itemCount: imagesIds.length,
            controller: scrollControler,
            itemBuilder: (context, index){
              return  FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300'),
              );
            }),
        ),
      ),
        floatingActionButton: FloatingActionButton(onPressed: () => context.pop(),
        child:
        isLoading ? SpinPerfect(
          infinite: true,
          child: Icon(Icons.refresh_rounded) 
        ) : FadeIn(child: Icon(Icons.arrow_back_ios_new_outlined))),
    );
  }
}