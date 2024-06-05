import 'package:flutter_easyloading/flutter_easyloading.dart';

void showLoader() async{
  await EasyLoading.show(
    status: 'loading...',
    maskType: EasyLoadingMaskType.custom,
  );
}
