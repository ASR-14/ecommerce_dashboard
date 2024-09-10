import 'package:seller_app/views/widgets/appbar_widget.dart';

import '../../const/const.dart';
import 'package:seller_app/views/widgets/text_style.dart';
import 'package:intl/intl.dart' as intl;

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: purpleColor,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: white,
        ),
      ),
      appBar: appbarWidget(products),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: List.generate(
              20,
              (index) => ListTile(
                leading: Image.asset(imgProduct,
                    width: 100, height: 100, fit: BoxFit.cover),
                title: boldText(text: "Product title", color: fontGrey),
                subtitle: normalText(text: "\$40.0", color: darkGrey),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
