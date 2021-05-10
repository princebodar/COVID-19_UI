import 'package:covid_19/constant.dart';
import 'package:covid_19/screens/details_screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:covid_19/widget/info.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 40),
              //height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(.3),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50)),
              ),
              child: Wrap(
                runSpacing: 15,
                spacing: 15,
                direction: Axis.horizontal,
                children: [
                  InfoCard(
                    title: "Confrimed Cases",
                    effectedNum: 92000,
                    iconColor: Colors.orange,
                    onTap: () {},
                  ),
                  InfoCard(
                    title: "Total Death",
                    effectedNum: 20000,
                    iconColor: Colors.red,
                    onTap: () {},
                  ),
                  InfoCard(
                    title: "Total Recovered",
                    effectedNum: 5630,
                    iconColor: Colors.pink,
                    onTap: () {},
                  ),
                  InfoCard(
                    title: "New Cases",
                    effectedNum: 2226,
                    iconColor: Colors.blue,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DetailsScreen();
                      }));
                    },
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Preventions",
                      style: Theme.of(context)
                          .textTheme
                          .title!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                    buildPrevention(),
                    SizedBox(height: 15),
                    buildHelpCard(context)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row buildPrevention() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PreventionCard(
          title: "Use Mask",
          imageSrc: "asset/icons/mask.jpg",
        ),
        PreventionCard(
          title: "Wash Hands",
          imageSrc: "asset/icons/handwash.png",
        ),
        PreventionCard(
          title: "Clean Disinfect",
          imageSrc: "asset/icons/disinfect.jpg",
        )
      ],
    );
  }

  Container buildHelpCard(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .4,
                top: 10,
                right: 10),
            height: 110,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.yellow, Colors.green],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "Dial 104 for \nMedical Help.!\n",
                    style: Theme.of(context).textTheme.title!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "If any symptoms appear",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.9), fontSize: 16))
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset("asset/icons/nurse.png"),
          ),
          Positioned(
              top: 20,
              right: 10,
              child: Image.asset(
                "asset/icons/virus.png",
                height: 40,
                width: 40,
              ))
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Center(child: Text("Covid-19 Updates")),
      backgroundColor: kPrimaryColor,
      elevation: 1,
      leading: IconButton(
        icon: Icon(
          Icons.menu_outlined,
          size: 40,
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search_rounded,
              size: 40,
            ))
      ],
    );
  }
}

class PreventionCard extends StatelessWidget {
  final String imageSrc;
  final String title;

  PreventionCard({required this.title, required this.imageSrc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageSrc,
          height: 80,
          width: 80,
        ),
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .title!
              .copyWith(color: kPrimaryColor, fontSize: 16),
        )
      ],
    );
  }
}
