import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seller_app/const/const.dart';
import 'package:seller_app/views/orders_screen/components/order_place.dart';
import 'package:seller_app/views/widgets/our_button.dart';
import 'package:seller_app/views/widgets/text_style.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: darkGrey),
          onPressed: () {
            Get.back();
          },
        ),
        title: boldText(text: "Order details", size: 16.0, color: fontGrey),
      ),
      bottomNavigationBar: SizedBox(
          height: 60,
          width: context.screenWidth,
          child:
              ourButton(color: green, onPress: () {}, title: "Confirm Order")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Visibility(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    boldText(
                        text: "Order status :", color: fontGrey, size: 16.0),
                    SwitchListTile(
                        activeColor: green,
                        value: true,
                        onChanged: (value) {},
                        title: boldText(text: "Placed", color: fontGrey)),
                    SwitchListTile(
                        activeColor: green,
                        value: true,
                        onChanged: (value) {},
                        title: boldText(text: "Confirmed", color: fontGrey)),
                    SwitchListTile(
                        activeColor: green,
                        value: false,
                        onChanged: (value) {},
                        title: boldText(text: "on Delivery", color: fontGrey)),
                    SwitchListTile(
                        activeColor: green,
                        value: false,
                        onChanged: (value) {},
                        title: boldText(text: "Delivered", color: fontGrey)),
                  ],
                )
                    .box
                    .padding(const EdgeInsets.all(8))
                    .outerShadowMd
                    .white
                    .border(color: const Color.fromARGB(255, 99, 99, 99))
                    .roundedSM
                    .make(),
              ),
              Column(
                children: [
                  orderPlaceDetails(
                      d1: "data['order_code']",
                      d2: "data['shipping_method']",
                      title1: "Order Code",
                      title2: "Shipping Method"),
                  orderPlaceDetails(
                      d1: DateTime.now(),
                      // d1: intl.DateFormat()
                      //     .add_yMd()
                      //     .format(data['order_date'].toDate()),
                      d2: "data['payment_method']",
                      title1: "Order Code",
                      title2: "Shipping Method"),
                  orderPlaceDetails(
                      d1: "Unpaid",
                      d2: "Order Placed",
                      title1: "Payment Status",
                      title2: "Delivery Status"),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // "Shipping Address".text.fontFamily(semibold).make(),
                            boldText(
                                text: "Shipping Address", color: purpleColor),
                            "{data['order_by_name']}".text.make(),
                            "{data['order_by_email']}".text.make(),
                            "{data['order_by_address']}".text.make(),
                            "{data['order_by_city']}".text.make(),
                            "{data['order_by_state']}".text.make(),
                            "{data['order_by_phone']}".text.make(),
                            "{data['order_by_postalcode']}".text.make(),
                          ],
                        ),
                        SizedBox(
                          width: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              boldText(
                                  text: "Total amount", color: purpleColor),
                              boldText(text: "\$300.0", color: red, size: 16.0)
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
                  .box
                  .outerShadowMd
                  .white
                  .border(color: const Color.fromARGB(255, 99, 99, 99))
                  .roundedSM
                  .make(),
              const Divider(),
              10.heightBox,
              boldText(text: "Ordered Products", color: fontGrey, size: 16.0),
              10.heightBox,
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: List.generate(
                  3,
                  (index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        orderPlaceDetails(
                            title1: "data['orders'][index]['title']",
                            title2: "data['orders'][index]['tprice']",
                            d1: "{data['orders'][index]['qty']}x",
                            d2: "Refundable"),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            width: 30,
                            height: 20,
                            color: purpleColor,
                          ),
                        ),
                        const Divider()
                      ],
                    );
                  },
                ).toList(),
              )
                  .box
                  .outerShadowMd
                  .white
                  .margin(const EdgeInsets.only(bottom: 4))
                  .make(),
              20.heightBox
            ],
          ),
        ),
      ),
    );
  }
}
