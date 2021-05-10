import 'package:flutter/material.dart';
import 'package:covid_19/widget/linechart.dart';
import 'package:covid_19/constant.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final int effectedNum;
  final Color iconColor;
  //final Function press;
  final GestureTapCallback? onTap;

  InfoCard(
      {required this.title,
      required this.effectedNum,
      required this.iconColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints /*any name*/) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: constraints.maxWidth / 2 - 10,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        alignment: Alignment.center,
                        height: 35,
                        width: 30,
                        decoration: BoxDecoration(
                            color: iconColor, shape: BoxShape.circle),
                        child: Image.asset(
                          "asset/icons/running.png",
                          height: 25,
                          width: 20,
                        ),
                      ),
                    ),
                    SizedBox(width: 6),
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(color: kTextColor),
                              children: [
                            TextSpan(
                              text: "$effectedNum \n",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                                text: "People",
                                style: TextStyle(
                                  fontSize: 14,
                                  height: 2,
                                ))
                          ])),
                    ),
                    Expanded(
                      child: LineReportChart(),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
/*

*/
