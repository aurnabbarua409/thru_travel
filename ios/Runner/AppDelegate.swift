import Flutter
import UIKit
import GoogleMaps


@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
        GMSServices.provideAPIKey("AIzaSyCZTRv24vE1zWXiLgKt5LbktOVGb1AeX_E")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
