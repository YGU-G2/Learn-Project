import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/screens/home/collage_main_page_datiles.dart';
import 'package:learn/screens/home/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learn/views/my_footer.dart';
import 'package:learn/widgets/body_title.dart';
import 'package:learn/widgets/list_tile_card.dart';

class CollagesMainPage extends StatelessWidget {
  final AppLocalizations appLocalizations;

  const CollagesMainPage({
    super.key,
    required this.appLocalizations,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FadeInDown(
          delay: Duration(milliseconds: 300),
          curve: Curves.fastOutSlowIn,
          duration: Duration(milliseconds: 500),
          child: BodyTitle(
            title: appLocalizations.all(appLocalizations.colleges),
          ),
        ),
        ListTileCard(
          title: "كلية الطب",
          press: () => Get.toNamed("${Home.id}/${CollageMainPageDatiles.id}"),
        ),
        ListTileCard(
          title: "كلية الهندسة وتكنولوجيا المعلومات",
          press: () => Get.toNamed("${Home.id}/${CollageMainPageDatiles.id}"),
        ),
        ListTileCard(
          title: "كلية العلوم الادارية والانسانية",
          press: () => Get.toNamed("${Home.id}/${CollageMainPageDatiles.id}"),
        ),
        MyFooter(
          appLocalizations: appLocalizations,
        ),
      ],
    );
    // return AnimatedCrossFade(
    //   firstChild: SizedBox(
    //     width: MediaQuery.of(context).size.width,
    //     height: MediaQuery.of(context).size.height,
    //     child: CollageMainPageDatiles(
    //       appLocalizations: widget.appLocalizations,
    //       goBack: () {
    //         changePlace(false);
    //       },
    //     ),
    //   ),
    //   secondChild: SizedBox(
    //     width: MediaQuery.of(context).size.width,
    //     height: MediaQuery.of(context).size.height,
    //     child: CollageMainPageList(
    //       appLocalizations: widget.appLocalizations,
    //       press: () {
    //         changePlace(true);
    //       },
    //     ),
    //   ),
    //   crossFadeState:
    //       isChose ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    //   duration: Duration(milliseconds: 500),
    // );
  }
}
