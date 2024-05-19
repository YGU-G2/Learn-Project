import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShowInfoListTile extends StatefulWidget {
  const ShowInfoListTile({
    super.key,
    required this.title,
    this.text,
    required this.icon,
    this.showEditBtn = true,
    this.onEditBtnPressed,
    this.delay = 700,
    this.showDivider = true,
    required this.appLocalizations,
    this.child,
  });

  final String title;
  final String? text;
  final Widget? child;
  final IconData icon;
  final bool showEditBtn;
  final VoidCallback? onEditBtnPressed;
  final int delay;
  final bool showDivider;
  final AppLocalizations appLocalizations;

  @override
  State<ShowInfoListTile> createState() => _ShowInfoListTileState();
}

class _ShowInfoListTileState extends State<ShowInfoListTile> {
  bool isSeeMore = true;

  @override
  Widget build(BuildContext context) {
    return BounceInRight(
      delay: Duration(
        milliseconds: widget.delay,
      ),
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 500),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            leading: Icon(
              widget.icon,
              color: Theme.of(context).colorScheme.primary,
              size: Get.width * 0.062, // 25
            ),
            title: Text(
              widget.title,
              style: TextStyle(
                fontSize: Get.width * 0.035, // 14
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            subtitle: widget.child ??
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width * 0.025,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isSeeMore
                            ? widget.text!.length > 200
                                ? widget.text!.substring(0, 200)
                                : widget.text!
                            : widget.text!,
                        style: TextStyle(
                          color: Theme.of(context).primaryColorLight,
                          fontSize: Get.width * 0.040, // 16
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (widget.text!.length > 200)
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isSeeMore = !isSeeMore;
                            });
                          },
                          child: Text(
                            isSeeMore
                                ? widget.appLocalizations.seeMore
                                : widget.appLocalizations.seeLess,
                            style: TextStyle(
                              fontSize: Get.width * 0.035, // 16
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
            trailing: widget.showEditBtn
                ? SizedBox(
                    width: 40,
                    child: TextButton(
                      onPressed: widget.onEditBtnPressed ?? () {},
                      child: Icon(
                        Icons.edit_rounded,
                        size: Get.width * 0.062,
                      ),
                    ),
                  )
                : null,
          ),
          if (widget.showDivider)
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.19,
              child: const Divider(
                height: 2,
              ),
            ),
        ],
      ),
    );
  }
}
