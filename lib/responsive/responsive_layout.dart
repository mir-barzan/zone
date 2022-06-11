import 'package:flutter/material.dart';
import 'package:zone/screens/home_desktop.dart';
import 'package:zone/screens/main_page.dart';

/*class ResponsiveLayout extends StatelessWidget {
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
*/
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

class ResponsiveLayout extends StatefulWidget {
  final Widget main_page;
  final Widget home_desktop;
  const ResponsiveLayout({
    Key? key,
    required this.main_page,
    required this.home_desktop,
  }) : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  num get webScreenSize => 600;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        // 600 can be changed to 900 if you want to display tablet screen with mobile screen layout
        return widget.home_desktop;
      }
      return widget.main_page;
    });
  }
}
