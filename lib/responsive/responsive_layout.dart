import 'package:flutter/material.dart';
import 'package:zone/screens/home_desktop.dart';
import 'dimensions.dart';
import 'package:zone/screens/main_page.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget main_page;
  final Widget home_desktop;

  ResponsiveLayout({required this.main_page, required this.home_desktop});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileWidth) {
          return main_page;
        } else {
          return home_desktop;
        }
      },
    );
  }
}

 /* @override
  Widget build(BuildContext context){
  return LayoutBuilder(
    builder:(context,constraints){
      if(constraints.maxWidth<600){
        return MyOneColumn();
      }else{
        return MyTwoColumnLayout();
    },
  );
}


 /* child:Layout Builder(
  builder:(context,constraints){
    if(constraints.maxWidth>1200){
      return UltraWide Layout();
    }else if(constraints.maxWidth>600){
      return Wide Layout();
      return NarrowLayout();
                                    to it from its parent),
  },
    }else{
    }*/
}}*/





