import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class MySelectFormField extends StatelessWidget {
  final String name;
  final List options;
  final double width;
  final String title;
  final bool isRequired;
  final Widget? label;
  final Widget? prefix;
  final Widget? suffix;
  final Color? fillColor;
  final int delay;
  final List<String? Function(dynamic)> validators;
  final Function(dynamic)? onChanged;
  final dynamic initialValue;

  const MySelectFormField({
    super.key,
    this.width = 300.0,
    required this.title,
    this.isRequired = false,
    this.label,
    this.prefix,
    this.suffix,
    this.fillColor,
    this.delay = 700,
    required this.name,
    required this.options,
    this.validators = const [],
    this.onChanged,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.025),
            child: FadeInRight(
              delay: Duration(milliseconds: delay),
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 500),
              child: Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                  if (isRequired)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        "*",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onError,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: BounceInRight(
              delay: Duration(milliseconds: delay + 200),
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 500),
              child: FormBuilderDropdown(
                initialValue: initialValue,
                onChanged: onChanged,
                menuMaxHeight: Get.height / 2,
                borderRadius: BorderRadius.circular(10),
                items: options.toSet().toList().map<DropdownMenuItem>(
                  (option) {
                    return DropdownMenuItem(
                      value: option,
                      child: Text(option ?? ""),
                    );
                  },
                ).toList(),
                name: name,
                style: TextStyle(color: Get.theme.primaryColorLight),
                decoration: InputDecoration(
                  prefixIcon: prefix,
                  suffixIcon: suffix,
                  label: label,
                  floatingLabelStyle: TextStyle(
                    color: Get.theme.colorScheme.primary,
                  ),
                  filled: true,
                  fillColor:
                      fillColor ?? Theme.of(context).colorScheme.background,
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Get.theme.colorScheme.onPrimary,
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                  ),
                  enabled: true,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Get.theme.colorScheme.primary,
                      style: BorderStyle.solid,
                      width: 3,
                    ),
                  ),
                  errorBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Get.theme.colorScheme.error,
                      style: BorderStyle.solid,
                      width: 3,
                    ),
                  ),
                  disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Get.theme.colorScheme.secondary,
                      width: 1,
                    ),
                  ),
                ),
                validator: FormBuilderValidators.compose(validators),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
