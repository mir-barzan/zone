import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zone/additional/colors.dart';

class PageTitleBar extends StatelessWidget {
  const PageTitleBar({Key? key, required this.title}) : super(key: key);
  final String title;
<<<<<<< HEAD
=======

>>>>>>> upstream/master
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 260.0),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 4,
        decoration: const BoxDecoration(
<<<<<<< HEAD
          color: kPrimaryLightColor,
=======
          color: primaryColor,
>>>>>>> upstream/master
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 20,
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
                color: Color(0xfff575861)),
          ),
        ),
      ),
    );
  }
}

class UnderPart extends StatelessWidget {
  const UnderPart(
      {Key? key,
      required this.title,
      required this.navigatorText,
      required this.onTap})
      : super(key: key);
  final String title;
  final String navigatorText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 13,
              color: Colors.grey,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () {
            onTap();
          },
          child: Text(
            navigatorText,
            style: const TextStyle(
<<<<<<< HEAD
                color: kPrimaryColor,
=======
                color: offersColor,
>>>>>>> upstream/master
                fontSize: 13,
                fontWeight: FontWeight.w600,
                fontFamily: 'Opensans'),
          ),
        )
      ],
    );
  }
}

class Upside extends StatelessWidget {
  const Upside({Key? key, required this.imgUrl}) : super(key: key);
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height / 2,
<<<<<<< HEAD
          color: kPrimaryColor,
=======
          color: offersColor,
>>>>>>> upstream/master
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Image.asset(
              imgUrl,
              alignment: Alignment.topCenter,
              scale: 8,
            ),
          ),
        ),
<<<<<<< HEAD
        iconBackButton(context),
=======
>>>>>>> upstream/master
        Positioned(
          left: 0,
          top: 175,
          child: Image.network(
            "https://ouch-cdn2.icons8.com/gEMjZ4ZC639WYTYjpan-J3XByArwXzS7lUcNL-UMVdk/rs:fit:196:289/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvMi80/NzU5OTI4ZS04OWE3/LTRhOTYtYjdjMi0w/ZDA0MWI2Y2E3MTQu/c3Zn.png",
            scale: 3,
          ),
        ),
        Positioned(
          right: 0,
          top: 60,
          child: Image.network(
            "https://ouch-cdn2.icons8.com/vKz7XNZvZiNKlkUWT2HjP8oNZ8hZ0UblhuF8J6sGRGI/rs:fit:196:112/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNjg3/LzA3ZDZiZjRmLWFj/OTYtNGRmMy05ZGYz/LTNhNWQzOWI5NGYz/MC5zdmc.png",
            scale: 3,
          ),
        ),
      ],
    );
  }
}

iconBackButton(BuildContext context) {
  return IconButton(
    color: Colors.white,
    iconSize: 28,
    icon: const Icon(CupertinoIcons.arrow_left),
    onPressed: () {
      Navigator.pop(context);
    },
  );
}
