import 'package:epasien/app/modules/halaman_booking/components/MLCalenderComponent.dart';
import 'package:epasien/app/data/MLDepartmentData.dart';
import 'package:epasien/app/modules/halaman_booking/controllers/halaman_booking_controller.dart';
import 'package:epasien/app/utils/MLColors.dart';
import 'package:epasien/app/utils/MLDataProvider.dart';
import 'package:epasien/app/utils/MLImage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';

class MLClinicVisitComponent extends StatefulWidget {
  @override
  MLClinicVisitComponentState createState() => MLClinicVisitComponentState();
}

class MLClinicVisitComponentState extends State<MLClinicVisitComponent> {
  final controller = Get.find<HalamanBookingController>();
  static String tag = '/MLClinicVisitComponent';
  List<MLDepartmentData> departmentList = mlServiceListDataList();
  // int? selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          16.height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Booking Poliklinik', style: boldTextStyle(size: 24)),
                  8.height,
                ],
              ).expand(),
              // mlRoundedIconContainer(Icons.search, mlColorBlue),
              // 16.width,
              // mlRoundedIconContainer(
              //     Icons.calendar_view_day_outlined, mlColorBlue),
            ],
          ).paddingOnly(right: 16.0, left: 16.0),
          MLCalenderComponent(),
          8.height,
          Obx(
            () => controller.listPoliklinik.isEmpty
                ? Column(
                    children: [
                      Lottie.asset('lottie/search-not-found.json')
                          .flexible(flex: 3),
                      Text(
                        'Jadwal tidak ditemukan',
                        style: primaryTextStyle(),
                      ).flexible(),
                    ],
                  ).withSize(width: 300, height: 300).center()
                : ListView.builder(
                    padding:
                        EdgeInsets.only(right: 16.0, left: 16.0, bottom: 70),
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: controller.listPoliklinik.length,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => Container(
                          margin: EdgeInsets.only(bottom: 16),
                          padding: EdgeInsets.all(8.0),
                          decoration: boxDecorationWithRoundedCorners(
                            border: Border.all(
                              color: controller.selectedIndex.value == index
                                  ? mlColorBlue
                                  : mlColorLightGrey100,
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset((ml_ic_dashHomeVisit)!.validate(),
                                          height: 75,
                                          width: 75,
                                          fit: BoxFit.fill)
                                      .paddingAll(8.0)
                                      .expand(flex: 1),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          (controller.listPoliklinik
                                                  .value[index].nmPoli)!
                                              .validate(),
                                          style: boldTextStyle(size: 18)),
                                      8.height,
                                      // Text((departmentList[index].subtitle).validate(),
                                      //     style: secondaryTextStyle()),
                                      // 8.height,
                                      Text(
                                          (controller.listPoliklinik
                                                  .value[index].nmDokter)
                                              .validate(),
                                          style: boldTextStyle(
                                              color: mlColorDarkBlue)),
                                    ],
                                  ).expand(flex: 3),
                                ],
                              ),
                              8.height,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: Icon(
                                              Icons.watch_later_outlined,
                                              size: 14),
                                        ),
                                        TextSpan(
                                            text: ' Jam pelayanan',
                                            style: secondaryTextStyle()),
                                      ],
                                    ),
                                  ),
                                  Text(
                                      '${controller.listPoliklinik.value[index].jamMulai} - ${controller.listPoliklinik.value[index].jamSelesai}',
                                      style: secondaryTextStyle(
                                          color: Colors.black87)),
                                ],
                              ).paddingOnly(left: 8, right: 8),
                              8.height,
                            ],
                          ),
                        ).onTap(
                          () {
                            // print(
                            //     controller.listPoliklinik.value[index].nmDokter);
                            controller.selectedIndex.value = index;
                            controller.selectedKdDokter.value = controller
                                .listPoliklinik.value[index].kdDokter!;
                            controller.selectedDokter.value = controller
                                .listPoliklinik.value[index].nmDokter!;
                            controller.selectedKdPoli.value =
                                controller.listPoliklinik.value[index].kdPoli!;
                            controller.selectedPoli.value =
                                controller.listPoliklinik.value[index].nmPoli!;
                            controller.selectedJam.value =
                                '${controller.listPoliklinik.value[index].jamMulai!} - ${controller.listPoliklinik.value[index].jamSelesai!}';
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}