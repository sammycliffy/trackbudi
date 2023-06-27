import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/colors.dart';

class TrackbudiCheckbox extends HookWidget {
  final bool? Function(bool?)? isCheckedState;
  const TrackbudiCheckbox({super.key, this.isCheckedState});

  @override
  Widget build(BuildContext context) {
    final isChecked = useState<bool>(false);
    return GestureDetector(
      onTap: () {
        isChecked.value = !isChecked.value;
        isCheckedState!(isChecked.value);
      },
      child: Container(
        width: 17,
        height: 17,
        decoration: BoxDecoration(
            color: AppColors.primary, borderRadius: BorderRadius.circular(2)),
        child: isChecked.value
            ? const Center(
                child: Icon(
                  Icons.check,
                  size: 15,
                  color: AppColors.white,
                ),
              )
            : Container(
                margin: const EdgeInsets.all(1),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                ),
              ),
      ),
    );
  }
}
