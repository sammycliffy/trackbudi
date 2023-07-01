import 'package:flutter/material.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/app_spacer.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/colors.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/custom_text.dart';

class TrackBudiDropdown extends StatefulWidget {
  final List<String>? dropdownList;
  final Function(Object?)? onChange;
  final String? Function(String?)? validator;
  final String label;
  const TrackBudiDropdown(
      {super.key,
      this.validator,
      required this.dropdownList,
      required this.label,
      this.onChange});

  @override
  State<TrackBudiDropdown> createState() => _TrackBudiDropdownState();
}

class _TrackBudiDropdownState extends State<TrackBudiDropdown> {
  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText(
            text: widget.label, fontSize: 14, textColor: AppColors.textPrimary),
        heightSpace(2),
        SizedBox(
          height: 75,
          child: DropdownButtonFormField(
              value: widget.dropdownList?.first,
              validator: widget.validator,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  fillColor: Colors.white,
                  filled: true,
                  errorStyle: const TextStyle(fontSize: 13),
                  enabledBorder: AppColors.normalBorder,
                  errorBorder: AppColors.errorBorder,
                  focusedBorder: AppColors.normalBorder,
                  focusedErrorBorder: AppColors.normalBorder),
              items: widget.dropdownList!
                  .map((text) => DropdownMenuItem(
                      value: text,
                      child: Text(
                        text.toString(),
                        style: const TextStyle(
                            color: AppColors.textPrimary, fontSize: 14),
                      )))
                  .toList(),
              onChanged: widget.onChange),
        ),
      ],
    );
  }
}
