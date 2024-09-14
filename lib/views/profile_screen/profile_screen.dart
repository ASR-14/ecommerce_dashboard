import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:seller_app/controllers/auth_controller.dart';
import 'package:seller_app/controllers/profile_controller.dart';
import 'package:seller_app/services/store_services.dart';
import 'package:seller_app/views/auth_screen/login_screen.dart';
import 'package:seller_app/views/messages_screen/messages_screen.dart';
import 'package:seller_app/views/profile_screen/edit_profilescreen.dart';
import 'package:seller_app/views/shop_screen/shop_settings_screen.dart';
import 'package:seller_app/views/widgets/loading_indicator.dart';
import 'package:seller_app/views/widgets/text_style.dart';

import '../../const/const.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: boldText(text: settings, size: 16.0),
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const EditProfilescreen());
              },
              icon: const Icon(
                Icons.edit,
                color: white,
              )),
          TextButton(
              onPressed: () async {
                await Get.find<AuthController>().signoutMethod(context);
                Get.offAll(() => const LoginScreen());
              },
              child: normalText(text: logout))
        ],
      ),
      body: FutureBuilder(
        future: StoreServices.getProfile(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return loadingIndicator(circleCorlor: white);
          } else {
            controller.snapshotData = snapshot.data!.docs[0];

            return Column(
              children: [
                ListTile(
                  leading: Image.asset(imgProduct)
                      .box
                      .roundedFull
                      .clip(Clip.antiAlias)
                      .make(),
                  title: boldText(
                      text: "${controller.snapshotData['vendor_name']}"),
                  subtitle:
                      normalText(text: "${controller.snapshotData['email']}"),
                ),
                const Divider(),
                10.heightBox,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: List.generate(
                      profileButtonIcons.length,
                      (index) => ListTile(
                        onTap: () {
                          switch (index) {
                            case 0:
                              Get.to(() => const ShopSettings());
                              break;
                            case 1:
                              Get.to(() => const MessagesScreen());
                              break;
                            default:
                          }
                        },
                        leading: Icon(profileButtonIcons[index], color: white),
                        title: normalText(text: profileButtonTitles[index]),
                      ),
                    ),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
