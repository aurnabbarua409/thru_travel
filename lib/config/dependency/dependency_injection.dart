import 'package:get/get.dart';
import 'package:new_untitled/features/friend/presentation/controller/friend_controller.dart';

import '../../component/google_map/google_map.dart';
import '../../features/auth/change_password/presentation/controller/change_password_controller.dart';
import '../../features/auth/forgot password/presentation/controller/forget_password_controller.dart';
import '../../features/auth/sign in/presentation/controller/sign_in_controller.dart';
import '../../features/auth/sign up/presentation/controller/sign_up_controller.dart';
import '../../features/experience/presentation/controller/add_experience_controller.dart';
import '../../features/happening/presentation/controller/happening_controller.dart';
import '../../features/home/presentation/controller/home_controller.dart';
import '../../features/message/presentation/controller/chat_controller.dart';
import '../../features/message/presentation/controller/message_controller.dart';
import '../../features/notifications/presentation/controller/notifications_controller.dart';
import '../../features/plans/presentation/controller/plans_controller.dart';
import '../../features/profile/presentation/controller/profile_controller.dart';
import '../../features/setting/presentation/controller/privacy_policy_controller.dart';
import '../../features/setting/presentation/controller/setting_controller.dart';
import '../../features/setting/presentation/controller/terms_of_services_controller.dart';
import '../../features/travel_log/presentation/controller/travel_log_controller.dart';
import '../../features/trip/presentation/controller/trip_controller.dart';

class DependencyInjection extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController(), fenix: true);
    Get.lazyPut(() => SignInController(), fenix: true);
    Get.lazyPut(() => ForgetPasswordController(), fenix: true);
    Get.lazyPut(() => ChangePasswordController(), fenix: true);
    Get.lazyPut(() => NotificationsController(), fenix: true);
    Get.lazyPut(() => ChatController(), fenix: true);
    Get.lazyPut(() => MessageController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => SettingController(), fenix: true);
    Get.lazyPut(() => PrivacyPolicyController(), fenix: true);
    Get.lazyPut(() => TermsOfServicesController(), fenix: true);
    Get.lazyPut(() => TripController(), fenix: true);
    Get.lazyPut(() => ShowGoogleMapController(), fenix: true);
    Get.lazyPut(() => HappeningController(), fenix: true);
    Get.lazyPut(() => TravelLogController(), fenix: true);
    Get.lazyPut(() => PlansController(), fenix: true);
    Get.lazyPut(() => FriendController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => AddExperienceController(), fenix: true);
  }
}
