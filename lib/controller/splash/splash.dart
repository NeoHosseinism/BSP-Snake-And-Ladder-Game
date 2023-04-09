import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snake_and_ladder/global.dart';
import 'package:snake_and_ladder/model/player/player.dart';

class SplashCtrl extends GetxController {
  List<TextEditingController> txtCtrls =
      List.generate(4, (index) => TextEditingController(text: "حسین"));
  // ! checkboxs and text editing controllers

  RxBool showSplash = true.obs;

  @override
  Future<void> onReady() async {
    super.onReady();

    // await Get.dialog(
    //   AlertDialog(
    //     backgroundColor: Colors.transparent,
    //     contentPadding: const EdgeInsets.all(0),
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    //     content: Container(
    //       padding: const EdgeInsets.all(20),
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(10),
    //         gradient: const RadialGradient(
    //           radius: 0.8,
    //           colors: [
    //             Color(0xFF772F1A),
    //             Color.fromARGB(255, 62, 39, 35),
    //           ],
    //         ),
    //       ),
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           const Text(
    //             "انتخاب بازیکنان",
    //             style: TextStyle(
    //               color: Colors.amber,
    //               fontSize: 14,
    //               fontFamily: "IRANSansXFaNum-Medium",
    //               decoration: TextDecoration.none,
    //             ),
    //           ),
    //           const SizedBox(height: 20),
    //           Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             mainAxisSize: MainAxisSize.min,
    //             children: List.generate(
    //               4,
    //               (index) {
    //                 return Padding(
    //                   padding: const EdgeInsets.symmetric(vertical: 8.0),
    //                   child: Row(
    //                     mainAxisSize: MainAxisSize.min,
    //                     children: [
    //                       Container(
    //                         height: 30,
    //                         width: 30,
    //                         decoration: BoxDecoration(
    //                             color: playerTokenColors[index],
    //                             borderRadius: BorderRadius.circular(25)),
    //                       ),
    //                       const SizedBox(width: 16),
    //                       Directionality(
    //                         textDirection: TextDirection.rtl,
    //                         child: Expanded(
    //                           child: SizedBox(
    //                             height: 40,
    //                             child: TextField(
    //                               controller: txtCtrls[index],
    //                               decoration: InputDecoration(
    //                                 filled: true,
    //                                 fillColor: Colors.grey[200],
    //                                 enabledBorder: OutlineInputBorder(
    //                                   borderRadius: BorderRadius.circular(8),
    //                                   borderSide: const BorderSide(
    //                                       color: Colors.transparent),
    //                                 ),
    //                                 focusedBorder: OutlineInputBorder(
    //                                   borderRadius: BorderRadius.circular(8),
    //                                   borderSide:
    //                                       const BorderSide(color: Colors.amber),
    //                                 ),
    //                                 hintText: 'نام بازیکن ${index + 1}',
    //                                 hintStyle: const TextStyle(
    //                                     color: Colors.grey, fontSize: 14),
    //                                 contentPadding: const EdgeInsets.symmetric(
    //                                     vertical: 0, horizontal: 8),
    //                               ),
    //                               onChanged: (value) {
    //                                 if (value.isNotEmpty) {
    //                                   checkBoxs[index].value = true;
    //                                 } else {
    //                                   checkBoxs[index].value = false;
    //                                 }
    //                               },
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                       const SizedBox(width: 5),
    //                       Transform.scale(
    //                         scale: 1.2,
    //                         child: Obx(
    //                           () => Checkbox(
    //                             side: const BorderSide(color: Colors.white),
    //                             activeColor: Colors.amber,
    //                             checkColor: Colors.white,
    //                             shape: RoundedRectangleBorder(
    //                               borderRadius: BorderRadius.circular(5),
    //                             ),
    //                             value: checkBoxs[index].value,
    //                             onChanged: (newValue) {},
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 );
    //               },
    //             ),
    //           ),
    //           const SizedBox(height: 15),
    //           MaterialButton(
    //             minWidth: double.infinity,
    //             color: Colors.brown,
    //             textColor: Colors.amber,
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(10),
    //             ),
    //             onPressed: () {
    //               if (checkBoxs
    //                       .indexWhere((element) => element.value == true) !=
    //                   -1) {
    for (int i = 0; i < txtCtrls.length; i++) {
      if (checkBoxs[i].value) {
        players.add(
          Player(
            id: i,
            name: txtCtrls[i].text,
            color: playerTokenColors[i],
            homeNo: -1,
            x: (-1.0).obs,
            y: (-1.0).obs,
          ),
        );
      }
    }
    //                 Get.back();
    //               } else {
    //                 Get.snackbar(
    //                   "خطا",
    //                   "برای شروع باید حداقل نام یک بازیکن را وارد نمائید",
    //                   backgroundColor: Colors.red,
    //                   colorText: Colors.white,
    //                   icon: const Icon(
    //                     Icons.warning_amber_rounded,
    //                     color: Colors.white,
    //                     textDirection: TextDirection.rtl,
    //                   ),
    //                 );
    //               }
    //             },
    //             child: const Text('شروع'),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    Get.offAllNamed("/home");
  }

  @override
  Future<void> onInit() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    showSplash.value = false;
    super.onInit();
  }
}
