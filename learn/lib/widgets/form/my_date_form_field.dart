import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class MyDateFormField extends StatelessWidget {
  final String name;
  final double width;
  final String title;
  final bool isRequired;
  final int? maxLength;
  final TextInputType? keyboardType;
  final Widget? label;
  final Widget? prefix;
  final Widget? suffix;
  final int? maxLines;
  final int? minLines;
  final Color? fillColor;
  final int delay;
  final List<String? Function(DateTime?)> validators;
  final Function(DateTime?)? onChanged;
  final DateTime? initialValue;

  const MyDateFormField({
    super.key,
    this.width = 300.0,
    required this.title,
    this.isRequired = false,
    this.maxLength,
    this.keyboardType,
    this.label,
    this.prefix,
    this.suffix,
    this.maxLines = 1,
    this.minLines,
    this.fillColor,
    this.delay = 700,
    required this.name,
    this.validators = const [],
    this.initialValue,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
              child: FormBuilderDateTimePicker(
                onChanged: onChanged ?? (DateTime) {},
                initialValue: initialValue,
                inputType: InputType.date,
                maxLines: maxLines,
                minLines: minLines,
                name: name,
                maxLength: maxLength,
                keyboardType: keyboardType,
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
