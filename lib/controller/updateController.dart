import 'package:get/get.dart';
import 'package:login_signup_screen/db/updateService.dart';

class UpdateController extends GetxController{

  Update service=Update();

  RxString nameItem = ''.obs;
  RxString type = ''.obs;
  RxString image = ''.obs;
  RxString shelf = ''.obs;

  sendData()async{
    await service.update(nameItem.value, type.value, image.value, shelf.value);
    print(nameItem.value+ type.value+ image.value+ shelf.value);
  }

}