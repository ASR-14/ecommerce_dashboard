import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/const/const.dart';
import 'package:seller_app/controllers/profile_controller.dart';
import 'package:seller_app/views/widgets/custom_textfield.dart';
import 'package:seller_app/views/widgets/loading_indicator.dart';
import 'package:seller_app/views/widgets/text_style.dart';

class EditProfilescreen extends StatefulWidget {
  final String? username;
  const EditProfilescreen({super.key, this.username});

  @override
  State<EditProfilescreen> createState() => _EditProfilescreenState();
}

class _EditProfilescreenState extends State<EditProfilescreen> {
  var controller = Get.find<ProfileController>();

  @override
  void initState() {
    controller.nameController.text = widget.username!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: purpleColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: boldText(text: "Edit Profile", size: 16.0),
          actions: [
            controller.isLoading.value
                ? loadingIndicator(circleCorlor: white)
                : TextButton(
                    onPressed: () async {
                      controller.isLoading(true);

                      if (controller.profileImgPath.value.isNotEmpty) {
                        controller.uploadProfileImage();
                      } else {
                        controller.profileImgLink =
                            controller.snapshotData['imgUrl'];
                        // controller.profileImgPath(data['imageUrl']);
                      }

                      if (controller.snapshotData['password'] ==
                          controller.oldpassController.text) {
                        await controller.changeAuthPassword(
                            email: controller.snapshotData['email'],
                            password: controller.oldpassController.text,
                            newpassword: controller.newpassController.text);

                        controller.updateProfile(
                            imgUrl: controller.profileImgLink,
                            name: controller.nameController.text,
                            password: controller.newpassController.text);
                        VxToast.show(context, msg: "uploaded");
                      } else if (controller
                              .oldpassController.text.isEmptyOrNull &&
                          controller.newpassController.text.isEmptyOrNull) {
                        controller.updateProfile(
                            imgUrl: controller.profileImgLink,
                            name: controller.nameController.text,
                            password: controller.snapshotData['password']);
                      } else {
                        VxToast.show(context, msg: "Error");
                        controller.isLoading(false);
                      }
                    },
                    child: normalText(text: save))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              controller.snapshotData['imageUrl'] == "" &&
                      controller.profileImgPath.isEmpty
                  ? Image.asset(imgProduct, width: 100, fit: BoxFit.cover)
                      .box
                      .roundedFull
                      .clip(Clip.antiAlias)
                      .make()
                  : controller.snapshotData['imageUrl'] != "" &&
                          controller.profileImgPath.isEmpty
                      ? Image.network(controller.snapshotData['imageUrl'],
                              width: 100, fit: BoxFit.cover)
                          .box
                          .roundedFull
                          .clip(Clip.antiAlias)
                          .make()
                      : Image.file(File(controller.profileImgPath.value),
                              width: 100, fit: BoxFit.cover)
                          .box
                          .roundedFull
                          .clip(Clip.antiAlias)
                          .make(),

              // Image.asset(imgProduct, width: 150)
              //     .box
              //     .roundedFull
              //     .clip(Clip.antiAlias)
              //     .make(),
              10.heightBox,
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: white),
                  onPressed: () {
                    controller.changeImage(context);
                  },
                  child: normalText(text: "Change Image", color: fontGrey)),
              10.heightBox,
              const Divider(
                color: white,
              ),
              customTextField(
                  label: name,
                  hint: "eg. Anh Khoa",
                  controller: controller.nameController),
              10.heightBox,
              Align(
                  alignment: Alignment.centerLeft,
                  child: boldText(text: "Change your password")),
              customTextField(
                  label: password,
                  hint: passwordHint,
                  controller: controller.oldpassController),
              10.heightBox,
              customTextField(
                  label: confirmPass,
                  hint: passwordHint,
                  controller: controller.newpassController),
            ],
          ),
        ),
      ),
    );
  }
}
