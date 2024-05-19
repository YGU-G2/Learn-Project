import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:get/get.dart';
import 'package:learn/utils/check_internet_connection.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learn/widgets/loading.dart';

class InternetStatus extends StatefulWidget {
  const InternetStatus({
    super.key,
    required this.appLocalizations,
  });

  final AppLocalizations appLocalizations;

  @override
  State<InternetStatus> createState() => _InternetStatusState();
}

class _InternetStatusState extends State<InternetStatus> {
  bool _hideWidget = false;
  bool _canShowInternetAlert = true;

  void hide() {
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        _hideWidget = true;
        _canShowInternetAlert = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (CheckInternetConnection.isInternetOnLine.value == false) {
      setState(() {
        _hideWidget = false;
        _canShowInternetAlert = false;
      });
      if (_canShowInternetAlert) {
        CheckInternetConnection.internetAlertDialog();
      }
    }

    return OfflineBuilder(
      connectivityBuilder: (context, value, child) {
        if (CheckInternetConnection.isInternetOnLine.value) {
          hide();
        }
        CheckInternetConnection.checkTheInternet();

        Timer.periodic(
          Duration(seconds: 5),
          (timer) {
            if (CheckInternetConnection.isInternetOnLine.value == false) {
              CheckInternetConnection.checkTheInternet();
            }
          },
        );

        return _hideWidget
            ? Container()
            : Container(
                color: CheckInternetConnection.isInternetOnLine.value
                    ? Colors.green
                    : Colors.red,
                height: 30,
                width: Get.width,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CheckInternetConnection.isInternetOnLine.value
                          ? SizedBox()
                          : Loading.getCubeGrid(
                            color: Colors.white
                          ),
                      CheckInternetConnection.isInternetOnLine.value
                          ? SizedBox()
                          : SizedBox(
                              width: 10,
                            ),
                      Text(
                        CheckInternetConnection.isInternetOnLine.value
                            ? widget.appLocalizations.connectedToTheInternet
                            : widget.appLocalizations.noInternetConnection,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
      child: Loading.getCubeGrid(
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
