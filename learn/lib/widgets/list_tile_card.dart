import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:learn/controller/language_controller.dart';

class ListTileCard extends StatelessWidget {
  final String title;
  final String date;
  final String text;
  final VoidCallback press;

  const ListTileCard({
    super.key,
    required this.title,
    this.date = "2024/1/21",
    this.text =
        "Lorem ipsum dolor sit amet consectetur, adipisicing elit. In sequi velit sunt alias? Laudantium blanditiis quo provident quas, laboriosam reprehenderit, vero maxime delectus deleniti, velit inventore neque harum atque accusamus?",
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    Widget divider = Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 110,
        child: const Divider(
          height: 0,
        ),
      ),
    );
    return Column(
      children: [
        TextButton(
          style: ButtonStyle(
            padding:
                MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 10)),
          ),
          onPressed: press,
          child: ListTile(
            contentPadding: const EdgeInsets.all(0),
            minVerticalPadding: 0,
            title: Directionality(
              textDirection: LanguageController.getCurrentLanguage() == "ar"
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        FlipInY(
                          delay: Duration(milliseconds: 700),
                          curve: Curves.fastOutSlowIn,
                          duration: Duration(milliseconds: 500),
                          child: Text(
                            title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                        ),
                        FadeInRight(
                          delay: Duration(milliseconds: 900),
                          curve: Curves.fastOutSlowIn,
                          duration: Duration(milliseconds: 500),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Text(
                                date,
                                style: TextStyle(
                                  fontSize: 12,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                        BounceInDown(
                          delay: Duration(milliseconds: 1100),
                          curve: Curves.fastOutSlowIn,
                          duration: Duration(milliseconds: 500),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              text.length > 80
                                  ? "${text.substring(0, 80)}..."
                                  : text,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ZoomIn(
                      delay: Duration(milliseconds: 300),
                      curve: Curves.fastOutSlowIn,
                      duration: Duration(milliseconds: 500),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/images/1.jpg",
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
        LanguageController.getCurrentLanguage() == "ar"
            ? FadeInRight(
                delay: Duration(milliseconds: 1300),
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 500),
                child: divider,
              )
            : FadeInLeft(
                delay: Duration(milliseconds: 1300),
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 500),
                child: divider,
              ),
      ],
    );
  }
}
