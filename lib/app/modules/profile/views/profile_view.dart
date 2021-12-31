import 'package:epasien/app/modules/profile/components/MLProfileBottomComponent.dart';
import 'package:epasien/app/utils/MLColors.dart';
import 'package:epasien/app/utils/MLImage.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:nb_utils/src/extensions/int_extensions.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: mlPrimaryColor,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 225,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: mlColorDarkBlue,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Icon(
                          Icons.logout,
                          color: white,
                          size: 30,
                        ),
                      ).paddingAll(10),
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                child: controller.pasien['jk'] == 'P'
                                    ? Image.asset(ml_ic_profile_picture!)
                                    : Image.asset('images/profile.png'),
                                radius: 40.0,
                                backgroundColor: mlColorCyan),
                            8.height,
                            Text(controller.pasien['nm_pasien'],
                                style: boldTextStyle(color: white, size: 20)),
                            4.height,
                            Text(controller.pasien['no_rkm_medis'],
                                style:
                                    secondaryTextStyle(color: white, size: 16)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == 0) {
                    return MLProfileBottomComponent();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
