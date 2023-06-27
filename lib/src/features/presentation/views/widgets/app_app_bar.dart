import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trackbudi_vendor/src/core/shared/resources/colors.dart';
import 'package:trackbudi_vendor/src/features/presentation/views/widgets/custom_text.dart';

import '../../../../core/shared/resources/app_images.dart';

appBar(context) => AppBar(
      backgroundColor: AppColors.white,
      elevation: 0.0,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SvgPicture.asset(AppImages.arrowBack),
        ),
      ),
      titleSpacing: 0,
      title: customText(
          text: 'Back', fontSize: 12, textColor: AppColors.textPrimary),
    );

class RefreshWid extends StatelessWidget {
  final Widget child;
  final Future<void> Function() onRefresh;
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey;
  const RefreshWid(
      {super.key,
      required this.child,
      required this.onRefresh,
      required this.refreshIndicatorKey});

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid ? buildAndroidRefresh() : buildIosRefreshWid();
  }

  buildAndroidRefresh() {
    return RefreshIndicator(
        onRefresh: onRefresh,
        color: Colors.grey.withOpacity(0.4),
        key: refreshIndicatorKey,
        child: child);
  }

  buildIosRefreshWid() {
    return CustomScrollView(
      slivers: [
        CupertinoSliverRefreshControl(
            onRefresh: onRefresh, key: refreshIndicatorKey),
        SliverToBoxAdapter(
          child: child,
        )
      ],
    );
  }
}
