import 'package:barbershop/src/core/constants/constants.dart';
import 'package:barbershop/src/core/ui/barbershop_icons.dart';
import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({super.key}) : hideUploadButton = false;
  const AvatarWidget.withoutButton({super.key}) : hideUploadButton = true;

  final bool hideUploadButton;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 102,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 92,
            height: 92,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.avatar),
              ),
            ),
          ),
          Positioned(
            right: -4,
            bottom: -4,
            child: Offstage(
              offstage: hideUploadButton,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: AppColors.brown,
                    width: 4,
                  ),
                ),
                child: const Icon(
                  BarbershopIcons.addEmployee,
                  color: AppColors.brown,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
