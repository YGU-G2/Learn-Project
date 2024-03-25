import 'package:animate_do/animate_do.dart';
import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/controller/language_controller.dart';
import 'package:learn/views/my_footer.dart';
import 'package:learn/widgets/body_title.dart';
import 'package:learn/widgets/my_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AboutPage extends StatelessWidget {
  final AppLocalizations appLocalizations;

  const AboutPage({super.key, required this.appLocalizations});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ZoomIn(
          delay: Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          duration: Duration(milliseconds: 500),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset("assets/images/1.jpg"),
            ),
          ),
        ),
        LanguageController.getCurrentLanguage() == "ar"
            ? FadeInRight(
                delay: Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 500),
                child: BodyTitle(
                  title: appLocalizations.aboutUniversity,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              )
            : FadeInLeft(
                delay: Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 500),
                child: BodyTitle(
                  title: appLocalizations.aboutUniversity,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
        BounceInDown(
          delay: Duration(milliseconds: 700),
          curve: Curves.fastOutSlowIn,
          duration: Duration(milliseconds: 500),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Lorem ipsum dolor sit amet consectetur, adipisicing elit. In sequi velit sunt alias? Laudantium blanditiis quo provident quas, laboriosam reprehenderit, vero maxime delectus deleniti, velit inventore neque harum atque accusamus? Lorem ipsum dolor sit amet consectetur, adipisicing elit. In sequi velit sunt alias? Laudantium blanditiis quo provident quas, laboriosam reprehenderit, vero maxime delectus deleniti, velit inventore neque harum atque accusamus? Lorem ipsum dolor sit amet consectetur, adipisicing elit. In sequi velit sunt alias? Laudantium blanditiis quo provident quas, laboriosam reprehenderit, vero maxime delectus deleniti, velit inventore neque harum atque accusamus? Lorem ipsum dolor sit amet consectetur, adipisicing elit. In sequi velit sunt alias? Laudantium blanditiis quo provident quas, laboriosam reprehenderit, vero maxime delectus deleniti, velit inventore neque harum atque accusamus?",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
        LanguageController.getCurrentLanguage() == "ar"
            ? FadeInRight(
                delay: Duration(milliseconds: 900),
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 500),
                child: BodyTitle(
                  title: appLocalizations.presidentSpeech,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              )
            : FadeInLeft(
                delay: Duration(milliseconds: 900),
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 500),
                child: BodyTitle(
                  title: appLocalizations.presidentSpeech,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
        BounceInDown(
          delay: Duration(milliseconds: 1100),
          curve: Curves.fastOutSlowIn,
          duration: Duration(milliseconds: 500),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Lorem ipsum dolor sit amet consectetur, adipisicing elit. In sequi velit sunt alias? Laudantium blanditiis quo provident quas, laboriosam reprehenderit, vero maxime delectus deleniti, velit inventore neque harum atque accusamus? Lorem ipsum dolor sit amet consectetur, adipisicing elit. In sequi velit sunt alias? Laudantium blanditiis quo provident quas, laboriosam reprehenderit, vero maxime delectus deleniti, velit inventore neque harum atque accusamus? Lorem ipsum dolor sit amet consectetur, adipisicing elit. In sequi velit sunt alias? Laudantium blanditiis quo provident quas, laboriosam reprehenderit, vero maxime delectus deleniti, velit inventore neque harum atque accusamus? Lorem ipsum dolor sit amet consectetur, adipisicing elit. In sequi velit sunt alias? Laudantium blanditiis quo provident quas, laboriosam reprehenderit, vero maxime delectus deleniti, velit inventore neque harum atque accusamus?",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
        LanguageController.getCurrentLanguage() == "ar"
            ? FadeInRight(
                delay: Duration(milliseconds: 900),
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 500),
                child: BodyTitle(
                  title: appLocalizations.images(appLocalizations.university),
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              )
            : FadeInLeft(
                delay: Duration(milliseconds: 900),
                curve: Curves.fastOutSlowIn,
                duration: Duration(milliseconds: 500),
                child: BodyTitle(
                  title: appLocalizations.images(appLocalizations.university),
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
        Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: ZoomIn(
            delay: Duration(milliseconds: 1100),
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 500),
            child: FanCarouselImageSlider(
              imagesLink: [
                "assets/images/1.jpg",
                "assets/images/1.jpg",
                "assets/images/1.jpg",
              ],
              isAssets: true,
              sliderHeight: 300,
              imageRadius: 10,
              autoPlay: false,
              indicatorActiveColor: Theme.of(context).colorScheme.primary,
              indicatorDeactiveColor: Theme.of(context).colorScheme.onPrimary,
              currentItemShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow,
                  blurRadius: 10,
                )
              ],
              sideItemsShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.shadow,
                  blurRadius: 50,
                )
              ],
              expandImageHeight: 400,
              expandedCloseBtnAlign: Alignment.bottomRight,
              expandedCloseBtnDecoration: BoxDecoration(
                color: Theme.of(context).primaryColorDark,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
              ),
              expandedCloseChild: SizedBox(
                width: 100,
                height: 50,
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
        ),
        Column(
          children: [
            FlipInY(
              delay: Duration(milliseconds: 1300),
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 500),
              child: MyButton(
                width: Get.width / 2,
                onPressed: () {},
                child: Text(
                  appLocalizations.register,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        MyFooter(
          appLocalizations: appLocalizations,
        ),
      ],
    );
  }
}
