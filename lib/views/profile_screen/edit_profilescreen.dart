import 'package:flutter/material.dart';
import 'package:seller_app/const/const.dart';
import 'package:seller_app/views/widgets/custom_textfield.dart';
import 'package:seller_app/views/widgets/text_style.dart';

class EditProfilescreen extends StatelessWidget {
  const EditProfilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: "Edit Profile", size: 16.0),
        actions: [TextButton(onPressed: () {}, child: normalText(text: save))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(imgProduct, width: 150)
                .box
                .roundedFull
                .clip(Clip.antiAlias)
                .make(),
            10.heightBox,
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: white),
                onPressed: () {},
                child: normalText(text: "Change Image", color: fontGrey)),
            10.heightBox,
            const Divider(
              color: white,
            ),
            customTextField(label: name, hint: "eg. Anh Khoa"),
            10.heightBox,
            customTextField(label: password, hint: passwordHint),
            10.heightBox,
            customTextField(label: confirmPass, hint: passwordHint),
          ],
        ),
      ),
    );
  }
}
