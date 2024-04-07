import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class MyPasswordFormField extends StatefulWidget {
  final String name;
  final double width;
  final String title;
  final bool isRequired;
  final int? maxLength;
  final TextInputType? keyboardType;
  final Widget? label;
  final Widget? prefix;
  final Widget? suffix;
  final int delay;
  final List<String? Function(String?)> validators;
  final Function(String?)? onChanged;
  final String? initialValue;

  const MyPasswordFormField({
    super.key,
    this.width = 300.0,
    required this.title,
    this.isRequired = false,
    this.maxLength,
    this.keyboardType,
    this.label,
    this.prefix,
    this.suffix,
    this.delay = 700,
    required this.name,
    this.validators = const [],
    this.onChanged,
    this.initialValue,
  });

  @override
  State<MyPasswordFormField> createState() => _MyPasswordFormFieldState();
}

class _MyPasswordFormFieldState extends State<MyPasswordFormField> {
  bool isProtected = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FadeInRight(
              delay: Duration(milliseconds: widget.delay - 200),
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 500),
              child: Row(
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                  if (widget.isRequired)
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
              delay: Duration(milliseconds: widget.delay),
              curve: Curves.fastOutSlowIn,
              duration: Duration(milliseconds: 500),
              child: FormBuilderTextField(
                initialValue: widget.initialValue,
                onChanged: widget.onChanged ?? (value) {},
                name: widget.name,
                obscureText: isProtected,
                maxLength: widget.maxLength,
                keyboardType: widget.keyboardType,
                style: TextStyle(color: Get.theme.primaryColorLight),
                decoration: InputDecoration(
                  prefixIcon: widget.prefix,
                  suffixIcon: widget.suffix != null
                      ? widget.suffix
                      : InkWell(
                          onTap: () {
                            setState(() {
                              isProtected = !isProtected;
                            });
                          },
                          child: isProtected
                              ? Icon(
                                  CupertinoIcons.eye_fill,
                                  size: 20,
                                )
                              : Icon(
                                  CupertinoIcons.eye_slash_fill,
                                  size: 20,
                                ),
                        ),
                  label: widget.label,
                  floatingLabelStyle: TextStyle(
                    color: Get.theme.colorScheme.primary,
                  ),
                  filled: true,
                  fillColor: Get.theme.colorScheme.background,
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
                      width: 2,
                    ),
                  ),
                ),
                validator: FormBuilderValidators.compose(widget.validators),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
