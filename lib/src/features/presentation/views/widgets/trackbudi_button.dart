import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/colors.dart';

class TrackBudiButton extends StatelessWidget {
  final Function()? onTap;
  final Color color;
  final Color? textColor;
  final String? buttonText;
  final bool? isLoading;
  final bool hasIcon;
  final Widget? iconWidget;
  final bool isSmall;
  final bool isButtonEnabled;
  final bool hasBorder;
  final double? height;
  final Color? borderColor;
  const TrackBudiButton(
      {Key? key,
      this.onTap,
      this.color = AppColors.primary,
      this.textColor,
      this.buttonText,
      this.isLoading = false,
      this.hasIcon = false,
      this.iconWidget,
      this.isSmall = false,
      this.isButtonEnabled = true,
      this.hasBorder = false,
      this.height = 50,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (_) => HapticFeedback.lightImpact(),
      onTap: isButtonEnabled ? onTap : null,
      child: Container(
        height: height,
        width: isSmall ? 150 : double.infinity,
        decoration: BoxDecoration(
          color: isLoading!
              ? color.withOpacity(.5)
              : isButtonEnabled
                  ? color
                  : color.withOpacity(.6),
          borderRadius: BorderRadius.circular(40),
          border: hasBorder
              ? Border.all(color: borderColor!)
              : Border.all(width: 0, color: color),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            hasIcon ? iconWidget! : const SizedBox.shrink(),
            hasIcon
                ? const SizedBox(
                    width: 15,
                  )
                : const SizedBox.shrink(),
            Center(
              child: Text(
                isLoading! ? '' : buttonText!,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, color: AppColors.white),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            isLoading!
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: AppColors.white,
                      strokeWidth: 1,
                    ))
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
