import 'index.dart';

class AppPages {
  AppPages._();

  static const initial = OnBoardingRoutes.onBoarding;
  static final routes = [
    ...HomeRoutes.routes,
    ...SignInRoutes.routes,
    ...ForgotPasswordRoutes.routes,
    ...VerificationRoutes.routes,
    ...SignUpRoutes.routes,
    ...AddNewMachineRoutes.routes,
    ...PairingCompleteRoutes.routes,
    ...ProfileRoutes.routes,
    ...HomeMachineRoutes.routes,
    ...PreparingCoffeeRoutes.routes,
    ...PublicMachineRoutes.routes,
    ...OrderPaymentRoutes.routes,
    ...OnBoardingRoutes.routes,
  ];
}
