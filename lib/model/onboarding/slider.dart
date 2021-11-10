import 'package:creditswitch/utils/Constants.dart';
import 'package:flutter/cupertino.dart';

class Slider {
  final String sliderImageUrl;
  final String sliderHeading;
  final String sliderSubHeading;

  Slider(
      {@required this.sliderImageUrl,
      @required this.sliderHeading,
      @required this.sliderSubHeading});
}

final sliderArrayList = [
  Slider(
      sliderImageUrl: 'assets/onboard1.png',
      sliderHeading: Constants.SLIDER_HEADING_1,
      sliderSubHeading: Constants.SLIDER_DESC1),
  Slider(
      sliderImageUrl: 'assets/onboard2.png',
      sliderHeading: Constants.SLIDER_HEADING_2,
      sliderSubHeading: Constants.SLIDER_DESC2),
  Slider(
      sliderImageUrl: 'assets/onboard3.png',
      sliderHeading: Constants.SLIDER_HEADING_3,
      sliderSubHeading: Constants.SLIDER_DESC3),
  Slider(
      sliderImageUrl: 'assets/onboard4.png',
      sliderHeading: Constants.SLIDER_HEADING_4,
      sliderSubHeading: Constants.SLIDER_DESC4),
];
