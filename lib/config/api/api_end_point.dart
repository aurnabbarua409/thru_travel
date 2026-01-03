class ApiEndPoint {
  static const baseUrl = "https://asad5002.binarybards.online/api/v1";
  static const imageUrl = "https://asad5002.binarybards.online";
  static const socketUrl = "https://asad5002.binarybards.online";

  static const signUp = "/auth/signup";
  static const verifyEmail = "/auth/verify-account/";
  static const signIn = "/auth/login";
  static const forgotPassword = "/auth/forget-password";
  static const verifyOtp = "/users/verify-otp";
  static const resetPassword = "/auth/reset-password";
  static const changePassword = "/auth/change-password";
  static const userProfile = "/user/profile";
  static const uploadImage = "/user/upload-images";
  static const notifications = "/notifications";
  static const privacyPolicies = "privacy-policies";
  static const termsOfServices = "terms-and-conditions";
  static const chats = "chats";
  static const messages = "/message";
  static const comments = "/comments/";
  static const happeningNow = "/plan/happening-now";
  static const travelLog = "/user/activity-log";
  static const plan = "/plan";
  static const event = "/events/db";
  static const friend = "/friend";
  static const request = "/request";
  static const newPlanActivity = "/activity/create-with-activity";
  static const addNewPlan = "/activity/add-to-plan";
  static const requestPlanAdd = "/request/plan-add";
  static const cancelRequestPlan = "/plan/remove-friend";
}
