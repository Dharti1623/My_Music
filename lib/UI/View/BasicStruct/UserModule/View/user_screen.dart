import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../Config/Services/network_manager.dart';
import '../../../../../Utils/error_screen.dart';
import 'user_view.dart';


class UserListing extends StatefulWidget {
  const UserListing({Key? key}) : super(key: key);

  @override
  State<UserListing> createState() => _UserListingState();
}

class _UserListingState extends State<UserListing> with WidgetsBindingObserver{

  final GetXNetworkManager networkManager = Get.find<GetXNetworkManager>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<GetXNetworkManager>(
        // ignore: unrelated_type_equality_checks
        builder: (builder) => networkManager.connectionType == 0
            ?SomethingWentWrong()
            : const UserView()
      ),
    );
  }
}
