import 'package:animate_do/animate_do.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/widgets/my_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyCardSlider extends StatelessWidget {
  final AppLocalizations appLocalizations;
  
  const MyCardSlider({
    super.key, required this.appLocalizations,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider(
        options: CarouselOptions(
          height: Get.height / 1.9,
          aspectRatio: 16 / 9,
          viewportFraction: Get.width * 0.001725,
          enlargeCenterPage: true,
        ),
        items: [
          Card(
            child: Padding(
              padding: EdgeInsets.all(Get.width * 0.020), // 8
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    ZoomIn(
                      delay: Duration(milliseconds: 300),
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 500),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset("assets/images/1.jpg"),
                      ),
                    ),
                    FlipInY(
                      delay: Duration(milliseconds: 500),
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 500),
                      child: Padding(
                        padding: EdgeInsets.all(Get.width * 0.020), // 8
                        child: Text(
                          "كلية الطب",
                          style: TextStyle(
                            fontSize: Get.width * 0.045, // 18
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                      ),
                    ),
                    BounceInDown(
                      delay: Duration(milliseconds: 700),
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 500),
                      child: Padding(
                        padding: EdgeInsets.all(Get.width * 0.020), // 8
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            "2024/1/21",
                            style: TextStyle(
                              fontSize: Get.width * 0.035, // 14
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    BounceInDown(
                      delay: Duration(milliseconds: 700),
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 500),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.020), // 8
                        child: Text(
                          "Lorem ipsum dolor sit amet consectetur, adipisicing elit. In sequi velit sunt alias? Laudantium blanditiis quo provident quas, laboriosam reprehenderit, vero maxime delectus deleniti, velit inventore neque harum atque accusamus?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: Get.width * 0.035, // 14
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                    FlipInY(
                      delay: Duration(milliseconds: 700),
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 500),
                      child: Padding(
                        padding: EdgeInsets.all(Get.width * 0.025), // 10
                        child: MyButton(
                          onPressed: () {},
                          width: Get.width * 0.365, // 150
                          child: Text(
                            appLocalizations.knowMore,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                              fontSize: Get.width * 0.035, // 14
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
