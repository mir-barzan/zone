import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zone/Services/sharedPrefs.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/screens/mainPages/addOfferMain/information.dart';

class OfferCard{
  String title;
  int price;
  String rate;

  OfferCard({required this.title, required this.price,this.rate = '0'});

   makeCard(){
    // return Container(color: offersColor ,child: Column(
    //   children: [
    //     Container(height: 150,width: 120,color: Colors.black45,),
    //     Container(height: 10,),
    //     Text(title, style: TextStyle(fontSize: 25, color: primaryColor),),
    //     Container(height: 10,),
    //     Row(children: [
    //       Text('${price.toString()} \$', style: TextStyle(fontSize: 25, color: primaryColor),),
    //       Row(
    //         children: [
    //           Text(rate, style: TextStyle(fontSize: 25, color: primaryColor),),
    //           Icon(Icons.star,color: Colors.amber,)
    //         ],
    //       ),
    //     ],)
    //   ],
    // ),);
     return Wrap(
       children:[ Container(

         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(
             16.0,
           ),
           color: offersColor
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             ClipRRect(
               borderRadius: const BorderRadius.only(
                 topLeft: Radius.circular(16.0),
                 topRight: Radius.circular(16.0),
               ),
               child: Image.network(
                 "https://images.unsplash.com/photo-1536329583941-14287ec6fc4e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80",
                 height: 170,
                 width: double.infinity,
                 fit: BoxFit.cover,
               ),
             ),
             Padding(
               padding: const EdgeInsets.fromLTRB(8,8, 8, 7),
               child: Column(

                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     'I will $title',
                     maxLines: 2,
                     overflow: TextOverflow.ellipsis,

                     style:
                       const TextStyle(
                           fontWeight: FontWeight.w700,
                           fontSize: 20,
                           color: primaryColor


                     ),
                   ),

                   Divider(height: 20,thickness: 1,color: primaryColor,),
                   Row(

                     children: [
                       Container(

                         padding: EdgeInsets.all(8),
                         decoration: BoxDecoration(
                           color: primaryColor,
                           borderRadius: BorderRadius.circular(40)
                         ),
                         child: Text(
                           "${price.toString()} \$",
                           style:
                             TextStyle(
                               fontWeight: FontWeight.w700,
                               color: offersColor,
                               fontSize: 25

                           ),
                         ),
                       ),
                       Expanded(
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             Text(
                               "${rate} / 5 ",
                               style:
                               TextStyle(
                                   fontWeight: FontWeight.w700,
                                   color: primaryColor,
                                   fontSize: 25

                               ),
                             ),Icon(Icons.star, color: Colors.amber,), Text(
                               "(0)",
                               style:
                               TextStyle(
                                   fontWeight: FontWeight.w700,
                                   color: primaryColor,
                                   fontSize: 15

                               ),
                             ),
                           ],
                         ),
                       ),
                     ],
                   ),
                   const SizedBox(
                     height: 8.0,
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [


                       Column(
                         children: [
                           IconButton(
                             onPressed: () {},
                             icon: Icon(
                               Icons.adaptive.share,color: primaryColor,
                             ),
                           ),
                           Text("Share", style: TextStyle(fontSize: 18, color: primaryColor),)
                         ],
                       ),
                       Column(
                         children: [
                           IconButton(
                             onPressed: () {},
                             icon: Icon(
                               CupertinoIcons.plus_app,color: primaryColor,
                             ),
                           ),
                           Text("Add to favorites", style: TextStyle(fontSize: 18, color: primaryColor),)

                         ],
                       ),
                     ],
                   ),
                 ],
               ),
             ),
           ],
         ),
       ),
     ]);
  }
}
getInPref(key,title) async{
  await sharedprefs.setData(key, title);
}