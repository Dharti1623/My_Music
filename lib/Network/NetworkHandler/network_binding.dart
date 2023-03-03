import 'package:get/get.dart';
import 'package:my_music/UI/View/LoginModule/ViewModel/login_view_model.dart';
import '../../Config/Services/network_manager.dart';
import '../../UI/View/BasicStruct/FlightModule/View_module/flight_view_model.dart';
import '../../UI/View/BasicStruct/UserModule/View_Model/user_view_model.dart';

class NetworkBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<GetXNetworkManager>(() => GetXNetworkManager());
    Get.lazyPut<UserViewModel>(() => UserViewModel(),fenix: true);
    Get.lazyPut<FlightViewModel>(() => FlightViewModel(),fenix: true);
    Get.lazyPut<LoginViewModel>(() => LoginViewModel(),fenix: true);
  }
}