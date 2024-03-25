import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:learn/views/my_footer.dart';
import 'package:learn/views/my_scaffold.dart';
import 'package:learn/widgets/body_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ActivitesMainPageDatiles extends StatelessWidget {
  const ActivitesMainPageDatiles({super.key});

  static String id = "/activites_main_page_datiles";

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    return MyScaffold(
      appLocalizations: appLocalizations!,
      useAppBar: true,
      hasBack: true,
      body: ListView(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset("assets/images/1.jpg"),
                ),
              ),
            ],
          ),
          BodyTitle(
            title: "نشاط",
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Lorem ipsum dolor sit amet consectetur, adipisicing elit. In sequi velit sunt alias? Laudantium blanditiis quo provident quas, laboriosam reprehenderit, vero maxime delectus deleniti, velit inventore neque harum atque accusamus? Lorem ipsum dolor sit amet consectetur, adipisicing elit. In sequi velit sunt alias? Laudantium blanditiis quo provident quas, laboriosam reprehenderit, vero maxime delectus deleniti, velit inventore neque harum atque accusamus? Lorem ipsum dolor sit amet consectetur, adipisicing elit. In sequi velit sunt alias? Laudantium blanditiis quo provident quas, laboriosam reprehenderit, vero maxime delectus deleniti, velit inventore neque harum atque accusamus? Lorem ipsum dolor sit amet consectetur, adipisicing elit. In sequi velit sunt alias? Laudantium blanditiis quo provident quas, laboriosam reprehenderit, vero maxime delectus deleniti, velit inventore neque harum atque accusamus?",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
          BodyTitle(
            title: appLocalizations!.images(appLocalizations!.activity),
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
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
          MyFooter(
            appLocalizations: appLocalizations,
          ),
        ],
      ),
    );
  }
}