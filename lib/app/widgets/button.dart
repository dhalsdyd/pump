import 'package:firebase_getx_boilerplate/app/core/color_theme.dart';
import 'package:firebase_getx_boilerplate/app/core/text_theme.dart';
import 'package:flutter/material.dart';

//Firbase_Getx_BoilerPlate...!
class FGBPButton extends StatelessWidget {
  const FGBPButton({
    Key? key,
    required this.child,
    this.color = AppColorTheme.mainColor,
    this.height,
    this.width,
    this.radius,
    this.onTap,
  }) : super(key: key);
  final Widget child;

  final double? height;
  final double? width;
  final double? radius;
  final Color? color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius ?? 24),
        ),
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: child,
        ),
      ),
    );
  }
}

class FGBPTextWithIconButton extends StatelessWidget {
  const FGBPTextWithIconButton({
    Key? key,
    required this.text,
    required this.iconData,
    this.height,
    this.color = AppColorTheme.mainColor,
    this.radius,
    this.onTap,
  }) : super(key: key);

  final String text;
  final IconData iconData;
  final double? height;
  final Color? color;
  final double? radius;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    const textColor = AppTextTheme.mediumWhite;
    return FGBPButton(
      height: height,
      onTap: onTap,
      color: color,
      radius: radius,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: AppColorTheme.white,
              ),
              const SizedBox(width: 10),
              Text(
                text,
                style: textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FGBPTextButton extends StatelessWidget {
  const FGBPTextButton({
    Key? key,
    required this.text,
    this.height,
    this.color = AppColorTheme.mainColor,
    this.radius,
    this.onTap,
  }) : super(key: key);

  final String text;
  final double? height;
  final Color? color;
  final double? radius;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    const textColor = AppTextTheme.mediumWhite;
    return FGBPButton(
      height: height,
      onTap: onTap,
      color: color,
      radius: radius,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            text,
            style: textColor,
          ),
        ),
      ),
    );
  }
}

class SmallFGBPButton extends StatelessWidget {
  const SmallFGBPButton(
      {Key? key,
      required this.child,
      this.height,
      this.color = AppColorTheme.mainColor,
      this.onTap})
      : super(key: key);

  final Widget child;
  final double? height;
  final Color? color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return FGBPButton(
      onTap: onTap,
      height: 48,
      radius: 16,
      child: child,
    );
  }
}
