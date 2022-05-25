import 'package:flutter/material.dart';
import 'dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget desktopBody;

  ResponsiveLayout({required this.mobileBody, required this.desktopBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < mobileWidth) {
          return mobileBody;
        } else {
          return desktopBody;
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
}*/
