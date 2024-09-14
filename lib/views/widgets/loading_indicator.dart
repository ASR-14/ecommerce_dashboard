import 'package:seller_app/const/const.dart';

Widget loadingIndicator({circleCorlor = purpleColor}) {
  return Center(
    child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(circleCorlor),
    ),
  );
}
