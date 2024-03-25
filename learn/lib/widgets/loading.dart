import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class Loading {
  static Widget getDoubleBounce({Color? color, double? size}) {
    return SpinKitDoubleBounce(
      color: color ?? Get.theme.colorScheme.onSurface,
      size: size ?? Get.width * 0.05,
    );
  }

  static Widget getWanderingCubes({Color? color, double? size}) {
    return SpinKitWanderingCubes(
      color: color ?? Get.theme.colorScheme.onSurface,
      size: size ?? Get.width * 0.05,
    );
  }

  static Widget getWave({Color? color, double? size}) {
    return SpinKitWave(
      color: color ?? Get.theme.colorScheme.onSurface,
      size: size ?? Get.width * 0.05,
    );
  }

  static Widget getFadingCube({Color? color, double? size}) {
    return SpinKitFadingCube(
      color: color ?? Get.theme.colorScheme.onSurface,
      size: size ?? Get.width * 0.05,
    );
  }

  static Widget getChasingDots({Color? color, double? size}) {
    return SpinKitChasingDots(
      color: color ?? Get.theme.colorScheme.onSurface,
      size: size ?? Get.width * 0.05,
    );
  }

  static Widget getThreeBounce({Color? color, double? size}) {
    return SpinKitThreeBounce(
      color: color ?? Get.theme.colorScheme.onSurface,
      size: size ?? Get.width * 0.05,
    );
  }

  static Widget getCircle({Color? color, double? size}) {
    return SpinKitCircle(
      color: color ?? Get.theme.colorScheme.onSurface,
      size: size ?? Get.width * 0.05,
    );
  }

  static Widget getCubeGrid({Color? color, double? size}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: SpinKitCubeGrid(
        color: color ?? Get.theme.colorScheme.onSurface,
        size: size ?? Get.width * 0.05,
      ),
    );
  }

  static Widget getFoldingCube({Color? color, double? size}) {
    return SpinKitFoldingCube(
      color: color ?? Get.theme.colorScheme.onSurface,
      size: size ?? Get.width * 0.05,
    );
  }

  static Widget getFadingCircle({Color? color, double? size}) {
    return SpinKitFadingCircle(
      color: color ?? Get.theme.colorScheme.onSurface,
      size: size ?? Get.width * 0.05,
    );
  } 
}