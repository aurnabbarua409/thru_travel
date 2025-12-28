import 'package:get/get.dart';
import 'package:new_untitled/features/friend/presentation/screen/friend_screen.dart';
import 'package:new_untitled/features/home/presentation/screen/category_screen.dart';
import 'package:new_untitled/features/home/presentation/screen/experience_details.dart';
import 'package:new_untitled/features/home/presentation/screen/home_screen.dart';
import 'package:new_untitled/features/plans/presentation/screen/plans_screen.dart';
import 'package:new_untitled/features/trip/presentation/screen/trip_screen.dart';
import '../../features/auth/change_password/presentation/screen/change_password_screen.dart';
import '../../features/auth/forgot password/presentation/screen/create_password.dart';
import '../../features/auth/forgot password/presentation/screen/forgot_password.dart';
import '../../features/auth/forgot password/presentation/screen/verify_screen.dart';
import '../../features/auth/sign in/presentation/screen/sign_in_screen.dart';
import '../../features/auth/sign up/presentation/screen/sign_up_screen.dart';
import '../../features/auth/sign up/presentation/screen/verify_user.dart';
import '../../features/experience/presentation/screen/add_experience_screen.dart';
import '../../features/happening/presentation/screen/happening_screen.dart';
import '../../features/home/presentation/screen/plan_details_screen.dart';
import '../../features/message/presentation/screen/chat_screen.dart';
import '../../features/message/presentation/screen/message_screen.dart';
import '../../features/notifications/presentation/screen/notifications_screen.dart';
import '../../features/onboarding_screen/onboarding_screen.dart';
import '../../features/profile/presentation/screen/add_bio_screen.dart';
import '../../features/profile/presentation/screen/add_location_screen.dart';
import '../../features/profile/presentation/screen/add_photo_screen.dart';
import '../../features/profile/presentation/screen/edit_profile.dart';
import '../../features/profile/presentation/screen/profile_screen.dart';
import '../../features/setting/presentation/screen/privacy_policy_screen.dart';
import '../../features/setting/presentation/screen/setting_screen.dart';
import '../../features/setting/presentation/screen/terms_of_services_screen.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/travel_log/presentation/screen/travel_log_screen.dart';

class AppRoutes {
  static const String test = "/test_screen.dart";
  static const String splash = "/splash_screen.dart";
  static const String onboarding = "/onboarding_screen.dart";
  static const String signUp = "/sign_up_screen.dart";
  static const String verifyUser = "/verify_user.dart";
  static const String signIn = "/sign_in_screen.dart";
  static const String forgotPassword = "/forgot_password.dart";
  static const String verifyEmail = "/verify_screen.dart";
  static const String createPassword = "/create_password.dart";
  static const String changePassword = "/change_password_screen.dart";
  static const String notifications = "/notifications_screen.dart";
  static const String chat = "/chat_screen.dart";
  static const String message = "/message_screen.dart";
  static const String profile = "/profile_screen.dart";
  static const String editProfile = "/edit_profile.dart";
  static const String privacyPolicy = "/privacy_policy_screen.dart";
  static const String termsOfServices = "/terms_of_services_screen.dart";
  static const String setting = "/setting_screen.dart";
  static const String trip = "/trip_screen.dart";
  static const String happening = "/happening_screen.dart";
  static const String travelLog = "/travel_log_screen.dart";
  static const String plans = "/plans_screen.dart";
  static const String friend = "/friend_screen.dart";
  static const String home = "/home_screen.dart";
  static const String category = "/category_screen.dart";
  static const String planDetails = "/plan_details_screen.dart";
  static const String addExperience = "/add_experience_screen.dart";
  static const String experienceDetails = "/experience_details.dart";
  static const String addPhoto = "/add_photo_screen.dart";
  static const String addBio = "/add_bio_screen.dart";
  static const String addLocation = "/add_location_screen.dart";

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: onboarding, page: () => const OnboardingScreen()),
    GetPage(name: signUp, page: () => SignUpScreen()),
    GetPage(name: verifyUser, page: () => const VerifyUser()),
    GetPage(name: signIn, page: () => SignInScreen()),
    GetPage(name: forgotPassword, page: () => ForgotPasswordScreen()),
    GetPage(name: verifyEmail, page: () => const VerifyScreen()),
    GetPage(name: createPassword, page: () => CreatePassword()),
    GetPage(name: changePassword, page: () => ChangePasswordScreen()),
    GetPage(name: notifications, page: () => const NotificationScreen()),
    GetPage(name: chat, page: () => const ChatListScreen()),
    GetPage(name: message, page: () => const MessageScreen()),
    GetPage(name: profile, page: () => const ProfileScreen()),
    GetPage(name: editProfile, page: () => EditProfile()),
    GetPage(name: privacyPolicy, page: () => const PrivacyPolicyScreen()),
    GetPage(name: termsOfServices, page: () => const TermsOfServicesScreen()),
    GetPage(name: setting, page: () => const SettingScreen()),
    GetPage(name: trip, page: () => const TripScreen()),
    GetPage(name: happening, page: () => const HappeningScreen()),
    GetPage(name: travelLog, page: () => const TravelLogScreen()),
    GetPage(name: plans, page: () => const PlansScreen()),
    GetPage(name: friend, page: () => FriendScreen()),
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: category, page: () => CategoryScreen()),
    GetPage(name: planDetails, page: () => PlanDetailsScreen()),
    GetPage(name: addExperience, page: () => AddExperienceScreen()),
    GetPage(name: experienceDetails, page: () => ExperienceDetails()),
    GetPage(name: addPhoto, page: () => AddPhotoScreen()),
    GetPage(name: addBio, page: () => AddBioScreen()),
    GetPage(name: addLocation, page: () => AddLocationScreen()),
  ];
}
