import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learn/widgets/lectuer_timer_card.dart';
import 'package:learn/widgets/percent_card.dart';

class LectuersHomePage extends StatelessWidget {
  const LectuersHomePage({super.key, this.appLocalizations});

  final AppLocalizations? appLocalizations;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        PercentCard(
          appLocalizations: appLocalizations,
          title: appLocalizations!.lectuers,
          icon: Icons.video_collection_rounded,
          total: 100,
          currentValue: 45,
        ),
        Padding(
          padding: EdgeInsets.all(Get.width * 0.025),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(Get.width * 0.025),
                child: Text(
                  appLocalizations!.today,
                  style: TextStyle(
                    fontSize: Get.width * 0.040,
                    fontWeight: FontWeight.bold,
                    color: Get.theme.primaryColorLight,
                  ),
                ),
              ),
              LectuerTimerCard(
                icon: Icons.video_collection_rounded,
                title: "Lectuer 1",
                subject: "Math",
                doctorName: "Dr / Ebrahim Alharby",
                seconds: 5,
                initialSeconds: 0,
                appLocalizations: appLocalizations,
              ),
              LectuerTimerCard(
                icon: Icons.video_collection_rounded,
                title: "Lectuer 2",
                subject: "English",
                doctorName: "Dr / Ebrahim Alharby",
                seconds: 120,
                initialSeconds: 0,
                appLocalizations: appLocalizations,
              ),
              Padding(
                padding: EdgeInsets.all(Get.width * 0.025),
                child: Text(
                  appLocalizations!.thisWeek,
                  style: TextStyle(
                      fontSize: Get.width * 0.040,
                      fontWeight: FontWeight.bold,
                      color: Get.theme.primaryColorLight),
                ),
              ),
              LectuerTimerCard(
                icon: Icons.video_collection_rounded,
                title: "Lectuer 1",
                subject: "Math",
                doctorName: "Dr / Ebrahim Alharby",
                seconds: 5000,
                initialSeconds: 0,
                appLocalizations: appLocalizations,
              ),
              LectuerTimerCard(
                icon: Icons.video_collection_rounded,
                title: "Lectuer 2",
                subject: "Arbic",
                doctorName: "Dr / Ebrahim Alharby",
                seconds: 5128,
                initialSeconds: 0,
                appLocalizations: appLocalizations,
              ),
              LectuerTimerCard(
                icon: Icons.video_collection_rounded,
                title: "Lectuer 1",
                subject: "Math",
                doctorName: "Dr / Ebrahim Alharby",
                seconds: 522974,
                initialSeconds: 0,
                appLocalizations: appLocalizations,
              ),
              LectuerTimerCard(
                icon: Icons.video_collection_rounded,
                title: "Lectuer 3",
                subject: "English",
                doctorName: "Dr / Ebrahim Alharby",
                seconds: 623743,
                initialSeconds: 0,
                appLocalizations: appLocalizations,
              ),
              LectuerTimerCard(
                icon: Icons.video_collection_rounded,
                title: "Lectuer 1",
                subject: "Math",
                doctorName: "Dr / Ebrahim Alharby",
                seconds: 723574,
                initialSeconds: 0,
                appLocalizations: appLocalizations,
              ),
              LectuerTimerCard(
                icon: Icons.video_collection_rounded,
                title: "Lectuer 3",
                subject: "English",
                doctorName: "Dr / Ebrahim Alharby",
                seconds: 923643,
                initialSeconds: 0,
                appLocalizations: appLocalizations,
              ),
              LectuerTimerCard(
                icon: Icons.video_collection_rounded,
                title: "Lectuer 3",
                subject: "English",
                doctorName: "Dr / Ebrahim Alharby",
                seconds: 999993757643,
                initialSeconds: 0,
                appLocalizations: appLocalizations,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
