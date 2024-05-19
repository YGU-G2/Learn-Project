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
    return SizedBox(
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
              child: Column(
                children: [
                  Expanded(
                    flex: 10,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset("assets/images/1.jpg"),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(top: Get.width * 0.020), // 8
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
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.only(right: Get.width * 0.020), // 8
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
                  Expanded(
                    flex: 8,
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
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: EdgeInsets.all(Get.width * 0.037), // 15
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
        ],
      ),
    );
  }
}
