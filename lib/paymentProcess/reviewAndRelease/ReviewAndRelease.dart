import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:zone/additional/colors.dart';
import 'package:zone/paymentProcess/reviewAndRelease/ReviewAndRelease2.dart';
import 'package:zone/widgets/AdditionalWidgets.dart';

class ReviewAndRelease extends StatefulWidget {
  final contractId;

  const ReviewAndRelease({Key? key, required this.contractId})
      : super(key: key);

  @override
  State<ReviewAndRelease> createState() => _ReviewAndReleaseState();
}

class _ReviewAndReleaseState extends State<ReviewAndRelease> {
  TextEditingController _offercommentController = new TextEditingController();
  double ratingHolder = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: offersColor,
        title: Text(
          'Ending contract',
          style: TextStyle(color: primaryColor),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(8),
          children: [
            Container(
              height: 30,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                Text(
                    'How do you rate your satisfaction\nabout the offer you bought?',
                    style: TextStyle(color: offersColor, fontSize: 18)),
                Container(
                  height: 30,
                ),
                RatingBar.builder(
                  itemSize: MediaQuery.of(context).size.width * 0.1,
                  ignoreGestures: false,
                  glow: true,
                  initialRating: 0,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      ratingHolder = rating;
                    });
                    ratingHolder = rating;
                    print(ratingHolder);
                  },
                ),
              ],
            ),
            Divider(
              thickness: 2,
              height: 100,
            ),
            Wrap(
              alignment: WrapAlignment.center,
              children: [
                Text('Any comment on the offer?',
                    style: TextStyle(color: offersColor, fontSize: 18)),
                Container(
                  height: 30,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: TextField(
                  controller: _offercommentController,
                  cursorColor: offersColor,
                  maxLines: 20,
                  minLines: 5,
                  maxLength: 300,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: offersColor, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    ),
                  )),
            ),
            InkWell(
              onTap: () {
                if (ratingHolder > 0) {
                  navigateTo(
                      context,
                      ReviewAndRelease2(
                        offerComment: _offercommentController.text,
                        offerRating: ratingHolder,
                        contractId: widget.contractId,
                      ));
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(""),
                        content: Text(
                            "Please make sure of that You rated the offer"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                //here
                                navigatePop(context, widget);
                              },
                              child: Text(
                                "Ok",
                                style: TextStyle(color: offersColor),
                              )),
                        ],
                      );
                    },
                  );
                }
              },
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Next',
                        style: TextStyle(color: offersColor, fontSize: 24)),
                    Icon(
                      Icons.arrow_forward,
                      color: offersColor,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
