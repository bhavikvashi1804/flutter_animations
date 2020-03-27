import 'package:flutter/material.dart';

import '../providers/myWidget_provider.dart';

class ListOfWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final _loadedWidgets=myWidgetProvider().items;

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Widgets'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx,index)=>ListTile(
          
          title: Text(_loadedWidgets[index].widgetName),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => _loadedWidgets[index].widget,)
            );
          },

        ),
        itemCount: _loadedWidgets.length
      ),
    );
      
  
  }
}