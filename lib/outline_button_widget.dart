import 'package:flutter/material.dart';

class AppOutlineButtonWidget extends StatelessWidget {
  const AppOutlineButtonWidget({
    Key? key,
    this.height,
    this.child,
    this.width,
    this.onTap,
    this.borderRadiusRadii = 0.0,
    this.padding,
    this.color,
    this.borderColor,
  }) : super(key: key);

  /// дочерний элемент
  final Widget? child;

  /// ширина
  final double? width;

  /// высота
  final double? height;

  /// внутреннний отступ
  final EdgeInsetsGeometry? padding;

  /// округление фигуры
  final double borderRadiusRadii;

  /// обратный вызов при нажатии на виджет
  final GestureTapCallback? onTap;

  /// цвет виджета
  final Color? color;

  /// цвет виджета
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: height ?? 0,
        minWidth: width ?? 0,
        maxHeight: height ?? 48,
      ),
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          elevation: 0,
          backgroundColor: color,
          primary: Colors.transparent,
          padding: padding ?? EdgeInsets.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          side: BorderSide(
            color: borderColor ?? const Color(0xFFF1CBDA),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusRadii),
          ),
        ),
        child: child,
      ),
    );
  }
}
