import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class TrackBudiDropdDownSearch extends StatelessWidget {
  final String? Function(List<String>?)? onChanged;
  const TrackBudiDropdDownSearch({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<String>.multiSelection(
        items: const [
          'Documents, Files, Books or Stationary',
          'Small appliances',
          'Large Electronics, Luggages or Furniture',
          'Frozen items, Perishables, or Prepared food delivery',
          'Clothing, Accessories or Baby Products'
        ],
        popupProps: const PopupPropsMultiSelection.menu(
          showSelectedItems: true,
        ),
        validator: (value) => (value!.isEmpty) ? 'Required' : null,
        onChanged: onChanged);
  }
}
