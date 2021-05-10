import 'package:covid_19/constant.dart';
import 'package:flutter/material.dart';
import 'package:covid_19/widget/weeklychart.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildDetailsAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 20),
                        blurRadius: 50,
                        color: Colors.black.withOpacity(0.05),
                      )
                    ]),
                child: Column(
                  children: [
                    buildTitle(),
                    SizedBox(height: 10),
                    buildCaseNumber(context),
                    SizedBox(height: 14),
                    Text(
                      "From Health Center",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: kTextMediumColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    WeeklyChart(),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildInfoTextWithPercentage(
                          percentage: "8.44",
                          title: "From Last Week",
                        ),
                        buildInfoTextWithPercentage(
                          percentage: "10.52",
                          title: "Recovery Rate",
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 21),
                      blurRadius: 54,
                      color: Colors.black.withOpacity(0.05),
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Global Map",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Icon(Icons.more_vert),
                      ],
                    ),
                    SizedBox(height: 10),
                    Image.asset(
                      "asset/icons/map.jpg",
                      height: 170,
                      width: double.infinity,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  RichText buildInfoTextWithPercentage(
      {required String title, required String percentage}) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "$percentage% \n",
            style: TextStyle(
              fontSize: 20,
              color: kPrimaryColor,
            ),
          ),
          TextSpan(
            text: title,
            style: TextStyle(
              color: kTextMediumColor,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Row buildCaseNumber(BuildContext context) {
    return Row(
      children: [
        Text(
          "2226 ",
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(color: kPrimaryColor, height: 1.1),
        ),
        Text(
          "6.2%",
          style: TextStyle(
            fontSize: 18,
            color: kPrimaryColor,
          ),
        ),
        Image.asset(
          "asset/icons/increase.jpg",
          height: 22,
          width: 30,
        )
      ],
    );
  }

  Row buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "New Cases",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: kTextMediumColor,
            fontSize: 16,
          ),
        ),
        Icon(Icons.more_vert),
      ],
    );
  }

  AppBar buildDetailsAppBar(BuildContext context) {
    return AppBar(
      title: Center(
          child: Text(
        "New Cases",
        style: TextStyle(color: kPrimaryColor),
      )),
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: kPrimaryColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search_rounded,
            color: kPrimaryColor,
          ),
          onPressed: () {},
        )
      ],
    );
  }
}
