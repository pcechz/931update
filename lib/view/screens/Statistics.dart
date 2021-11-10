import 'package:creditswitch/utils/colors.dart';
import 'package:creditswitch/view/screens/cashback.dart';
import 'package:creditswitch/view/screens/fund_wallet.dart';
import 'package:creditswitch/view/screens/wallet_history.dart';
import 'package:creditswitch/view/widgets/top_container.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Statistics extends StatefulWidget {
  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  List<String> months = [
    'ALL',
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC'
  ];
  final List<ChartData> chartData = [
    ChartData('Airtime', 25, Color.fromRGBO(29, 150, 210, 1)),
    ChartData('Internet Data', 38, Color.fromRGBO(39, 174, 96, 1)),
    ChartData('Television', 34, Color.fromRGBO(101, 230, 248, 1)),
    ChartData('Electricity', 52, Color.fromRGBO(159, 224, 43, 1))
  ];
  String generateListofMonths(DateTime time) {
    String returnString = '';
    for (int i = 0; i < 12; i++) {
      // increment the month value
      returnString += formatDate(DateTime(time.year, i, time.day), [M, '-']);
    }
    // remove the last dash (-)
    returnString = returnString.substring(0, returnString.length - 1);
    return returnString;
  }

  int _selectedIndex = 0;
  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  print(generateListofMonths(DateTime.now()));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(29, 150, 210, 1),
        toolbarHeight: 120,
        title: Container(
          color: Color.fromRGBO(29, 150, 210, 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'Statistics',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Circular Std',
                    fontSize: 18,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1.0555555555555556),
              ),
              Image.asset(
                'avatarprofile.png',
                height: 39.0,
                width: 38.0,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 18, top: 10),
                    child: Container(
                        width: MediaQuery.of(context).size.width - 34,
                        height: 126,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                            bottomLeft: Radius.circular(6),
                            bottomRight: Radius.circular(6),
                          ),
                        ),
                        child: FittedBox(
                          child: Image.asset('assets/statsheader.png'),
                          fit: BoxFit.fill,
                        )),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 16, right: 18, top: 14),
                      child: Container(
                          width: MediaQuery.of(context).size.width - 34,
                          height: 51,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(6),
                              topRight: Radius.circular(6),
                              bottomLeft: Radius.circular(6),
                              bottomRight: Radius.circular(6),
                            ),
                          ),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dui, aliquam nisl luctus senectus tincidunt ',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromRGBO(79, 79, 79, 1),
                                fontFamily: 'Avenir Next',
                                fontSize: 12,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 1.5833333333333333),
                          ))),
                  Padding(
                    padding: EdgeInsets.only(top: 33),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(left: 21),
                              child: // Figma Flutter Generator WallethistoryWidget - TEXT
                                  Text(
                                'Volume of transactions',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromRGBO(79, 79, 79, 1),
                                    fontFamily: 'Avenir Next',
                                    fontSize: 16,
                                    letterSpacing:
                                        0 /*percentages not used in flutter. defaulting to zero*/,
                                    fontWeight: FontWeight.normal,
                                    height: 1.1875),
                              )),
                        ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 21),
                    child: Container(
                        height: 28,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: months.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(left: 10), // add margin
                                padding: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                    color: _selectedIndex != null &&
                                            _selectedIndex == index
                                        ? Color.fromRGBO(29, 150, 210, 1)
                                        : Color.fromRGBO(86, 182, 230, 1),
                                    borderRadius: BorderRadius.circular(20.0)),
                                width: 58,
                                height: 28,
                                child: Container(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      months[index],
                                      style: TextStyle(
                                          color: _selectedIndex != null &&
                                                  _selectedIndex == index
                                              ? Colors.white
                                              : Color.fromRGBO(
                                                  29, 150, 210, 1)),
                                    ),
                                  ),
                                ),
                              );
                            })),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Stack(
                        alignment: Alignment.center, // <---------
                        children: [
                          SfCircularChart(series: <CircularSeries>[
                            // Renders doughnut chart

                            DoughnutSeries<ChartData, String>(
                                innerRadius: '80%',
                                dataSource: chartData,
                                pointColorMapper: (ChartData data, _) =>
                                    data.color,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y)
                          ]),
                          Center(
                              child: Text(
                            '210 \n\n TRANSACTION',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(41, 36, 36, 1),
                                fontFamily: 'Roboto',
                                fontSize: 15,
                                letterSpacing:
                                    0 /*percentages not used in flutter. defaulting to zero*/,
                                fontWeight: FontWeight.normal,
                                height: 0.8148148148148148),
                          )),

                          // Other widgets
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 10, left: 21, right: 21),
                      child: Container(
                        height: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: chartData.length,
                          itemBuilder: (context, index) => ListTile(
                            subtitle: Text(""),
                            leading: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                color: chartData[index].color,
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            title: Text(
                              chartData[index].x.toString(),
                              style: TextStyle(
                                  color: Color.fromRGBO(41, 37, 37, 1),
                                  fontFamily: 'Roboto',
                                  fontSize: 13,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1.6923076923076923),
                            ),
                            trailing: Text(
                              chartData[index].y.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(44, 164, 224, 1),
                                  fontFamily: 'Avenir Next',
                                  fontSize: 16,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1.1875),
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color color;
}
