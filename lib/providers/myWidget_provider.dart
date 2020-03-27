
import '../models/myWidgets.dart';


import '../screens/animated_builder_wScreen.dart';

class myWidgetProvider{

  

  List<MyWidget> _items=[
    MyWidget(
      widgetName: 'Animated Builder',
      appRoute: '/widget-animation-animated-builder',
      widget: AnimatedBuilderWidget(),
      
    ),


    MyWidget(
      widgetName: 'Animated Builder1',
      appRoute: '/widget-animation-animated-builder',
      widget: AnimatedBuilderWidget(),
      
    ),

  ];



  List<MyWidget> get items{
    return [..._items];
  }

  String getRouteName(String widgetName){
    MyWidget obj1=_items.firstWhere((element) => element.widgetName==widgetName);
    return obj1.appRoute;
  }


}