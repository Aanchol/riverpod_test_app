import 'package:flutter/material.dart';
import 'package:riverpod_test_app/core/widgets/image_avatar.dart';

import '../../config/assets.dart';
import '../themes/app_colors.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final VoidCallback? openDrawer;

  CustomAppBar({super.key, this.openDrawer})
    : preferredSize = Size.fromHeight(65);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 6,
      shadowColor: Colors.grey.withValues(alpha: 0.3),
      centerTitle: false,
      toolbarHeight: 65,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(7, 5.0)),
      ),
      titleSpacing: 0,
      backgroundColor: AppColors.primary,
      leading: ImageAvatar(fallbackImage: AssetImage(Assets.user)),
      title: Text("", style: TextStyle()),
    );
  }
}
