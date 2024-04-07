import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class MyCheckBoxFormField extends StatelessWidget {
  final String name;
  final double width;
  final String title;
  final Widget? label;
  final Widget? prefix;
  final Widget? suffix;
  final Color? fillColor;
  final int delay;
  final List<String? Function(bool?)> validators;
  final Function(bool?)? onChanged;
  final bool? initialValue;
  final bool isSelected;
  final String? subTitle;

  const MyCheckBoxFormField({
    super.key,
    this.width = 300.0,
    required this.title,
    this.label,
    this.prefix,
    this.suffix,
    this.fillColor,
    this.delay = 700,
    required this.name,
    this.validators = const [],
    this.onChanged,
    this.initialValue,
    this.isSelected = false,
    this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: BounceInRight(
        delay: Duration(milliseconds: delay + 200),
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 500),
        child: FormBuilderCheckbox(
          activeColor: Theme.of(context).colorScheme.primary,
          checkColor: Theme.of(context).colorScheme.onSurface,
          selected: isSelected,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
          subtitle: subTitle != null ? Text(subTitle ?? "") : null,
          title: Text(
            title,
            style: TextStyle(
              fontSize: Get.width * 0.040,
              fontWeight: FontWeight.bold,
            ),
          ),
          initialValue: initialValue,
          onChanged: onChanged ?? (value) {},
          name: name,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
              prefixIcon: prefix,
              suffixIcon: suffix,
              label: label,
              floatingLabelStyle: TextStyle(
                color: Get.theme.colorScheme.primary,
              ),
              filled: true,
              fillColor: fillColor ?? Theme.of(context).colorScheme.background,
              enabled: true,
              enabledBorder: InputBorder.none),
          validator: FormBuilderValidators.compose(validators),
        ),
      ),
    );
  }
}
