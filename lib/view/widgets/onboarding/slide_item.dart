import 'package:creditswitch/model/onboarding/slider.dart';
import 'package:creditswitch/utils/Constants.dart';
import 'package:creditswitch/utils/colors.dart';
import 'package:creditswitch/view/widgets/onboarding/slide_dots.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlideItem extends StatelessWidget {
  final int index;
  final int all;
  SlideItem(this.index, this.all);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 15.0,
        ),
        Container(
          height: MediaQuery.of(context).size.width * 0.4,
          width: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(sliderArrayList[index].sliderImageUrl))),
        ),
        SizedBox(
          height: 60.0,
        ),
        Text(
          sliderArrayList[index].sliderHeading,
          style: TextStyle(
            fontFamily: Constants.POPPINS,
            fontWeight: FontWeight.w600,
            fontSize: 23,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 5),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: Text(
              sliderArrayList[index].sliderSubHeading,
              style: TextStyle(
                fontFamily: Constants.Avenir,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.5,
                fontSize: 15.5,
                color: fa_sub_heading,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            for (int i = 0; i < this.all; i++)
              if (i == this.index) SlideDots(true) else SlideDots(false),
          ],
        ),
      ],
    );
  }
}
