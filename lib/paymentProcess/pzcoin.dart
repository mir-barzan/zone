import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zone/paymentProcess/paymentModel.dart';

import '../additional/colors.dart';
import './PurchaseApi.dart';

class pzcoin extends StatefulWidget {
  const pzcoin({Key? key}) : super(key: key);

  @override
  State<pzcoin> createState() => _pzcoinState();
}

class _pzcoinState extends State<pzcoin> {
  void initState() {
    super.initState();
  }

  List<PaymentTile> coinOffers = [
    PaymentTile("The Zoin Coin", "10", "5.99", '5', '5coins', false),
    PaymentTile("The Zoin Coin", "20", "12.99", '10', '10coins', false),
    PaymentTile("The Zoin Coin", "50", "24.99", '20', '20coins', false),
    PaymentTile("The Zoin Coin", "150", "109.99", '100', '100coins', false),
    PaymentTile("The Zoin Coin", "300", "209.99", '200', '200coins', true),
    PaymentTile("The Zoin test Coin", "1", "1", '1', '1coins', false),
  ];
  List<String> offersIDs = [
    '5coins',
    '10coins',
    '20coins',
    '100coins',
    '200coins',
    '1coins'
  ];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Expanded(
            child: SvgPicture.asset(
          'assets/images/zoneLogo.svg',
          color: primaryColor,
          width: 180,
        )),
        backgroundColor: offersColor,
        elevation: 0,
        actions: [],
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, index) {
          return coinOffers.length == 0
              ? Center(
                  child: Text('There is no offers at the moment'),
                )
              : paymentTiles(
                  coinOffers[index].label,
                  coinOffers[index].oldPrice,
                  coinOffers[index].offeredPrice,
                  coinOffers[index].coins,
                  coinOffers[index].IAPID,
                  coinOffers[index].bestOffer,
                  index);
        },
        shrinkWrap: true,
        itemCount: coinOffers.length,
      ),
    );
  }

  Widget paymentTiles(String label, String oldPrice, String offeredPrice,
      String coins, String IAPID, bool bestOffer, index) {
    return Stack(children: [
      Container(
        margin: EdgeInsets.only(bottom: 10, top: 10),
        decoration: BoxDecoration(
            color: Colors.green.shade200,
            borderRadius: BorderRadius.circular(30)),
        child: ListTile(
          leading: Container(
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.monetization_on,
                  color: offersColor,
                ),
                Text(
                  coins,
                  style: TextStyle(color: offersColor, fontSize: 21),
                )
              ],
            ),
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(30)),
          ),
          title: Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 15, top: 15),
              decoration: BoxDecoration(
                  color: primaryColor, borderRadius: BorderRadius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      '\$${oldPrice}',
                      style: TextStyle(
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                  // Container(
                  //   width: 30,
                  // ),
                  Text(
                    '\$${offeredPrice}',
                    style: TextStyle(
                        color: offersColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),

                  Container(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Text(
                          'Buy',
                          style: TextStyle(color: primaryColor, fontSize: 30),
                        ),
                        Icon(
                          Icons.shopping_cart,
                          color: primaryColor,
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        color: offersColor,
                        borderRadius: BorderRadius.circular(30)),
                  )
                ],
              ),
            ),
          ),
          onTap: () async {
            await PurchaseApi.PurchaseProduct(IAPID);
          },
        ),
      ),
      bestOffer == true
          ? Text(
              'Best Offer %',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21,
                foreground: Paint()
                  ..style = PaintingStyle.fill
                  ..strokeWidth = 3
                  ..color = Colors.red,
              ),
            )
          : SizedBox.shrink()
    ]);
  }
}
