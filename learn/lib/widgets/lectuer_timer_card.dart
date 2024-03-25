import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learn/widgets/my_button.dart';

class LectuerTimerCard extends StatefulWidget {
  final int seconds;
  final int initialSeconds;
  final AppLocalizations? appLocalizations;
  final IconData icon;
  final String title;
  final String subject;
  final String doctorName;

  const LectuerTimerCard({
    super.key,
    required this.seconds,
    required this.initialSeconds,
    this.appLocalizations,
    required this.title,
    required this.subject,
    required this.doctorName,
    required this.icon,
  });

  @override
  State<LectuerTimerCard> createState() => _LectuerTimerCardState();
}

class _LectuerTimerCardState extends State<LectuerTimerCard> {
  bool isComplate = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: TextButton(
          style: ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.zero),
          ),
          onPressed: () {},
          child: ListTile(
            title: Text(
              widget.title,
              style: TextStyle(
                fontSize: Get.width * 0.037,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColorLight,
              ),
            ),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.subject,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: Get.width * 0.035,
                  ),
                ),
                Text(
                  widget.doctorName,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: Get.width * 0.035,
                  ),
                ),
              ],
            ),
            leading: Icon(
              widget.icon,
              color: Theme.of(context).colorScheme.primary,
              size: Get.width * 0.073,
            ),
            trailing: SizedBox(
              width: 65,
              child: isComplate
                  ? MyButton(
                      onPressed: () {},
                      elevation: 3,
                      child: Text(
                        widget.appLocalizations!.presence,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: Get.width * 0.032, // 13
                        ),
                      ))
                  : CircularCountDownTimer(
                      duration: widget.seconds,
                      initialDuration: widget.initialSeconds,
                      controller: CountDownController(),
                      width: 60,
                      height: 60,
                      ringColor: Theme.of(context).colorScheme.onBackground,
                      ringGradient: null,
                      fillColor: Theme.of(context).colorScheme.primary,
                      fillGradient: null,
                      backgroundColor: Theme.of(context).primaryColorDark,
                      backgroundGradient: null,
                      strokeWidth: 5,
                      strokeCap: StrokeCap.round,
                      textStyle: TextStyle(
                        fontSize: Get.width * 0.025, // 10
                        color: Theme.of(context).primaryColorLight,
                        fontWeight: FontWeight.bold,
                      ),
                      isReverse: true,
                      isReverseAnimation: false,
                      isTimerTextShown: true,
                      autoStart: true,
                      onComplete: () {
                        setState(() {
                          isComplate = true;
                        });
                      },
                      timeFormatterFunction:
                          (defaultFormatterFunction, duration) {
                        if (duration.inDays >= 30) {
                          return "     ${duration.inDays.remainder(30)} \n${widget.appLocalizations!.months}";
                        } else if (duration.inDays != 0) {
                          return "   ${duration.inDays} \n${widget.appLocalizations!.days}";
                        } else if (duration.inHours != 0) {
                          return "    ${duration.inHours.remainder(60)} \n${widget.appLocalizations!.hours}";
                        } else if (duration.inMinutes != 0) {
                          return "     ${duration.inMinutes.remainder(60)} \n${widget.appLocalizations!.minutes}";
                        } else {
                          return "      ${duration.inSeconds.remainder(60)} \n${widget.appLocalizations!.seconds}";
                        }
                      },
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
