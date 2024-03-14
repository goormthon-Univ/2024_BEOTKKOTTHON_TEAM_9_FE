import 'package:bommeong/views/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:bommeong/bindings/root_binding.dart';
import 'package:bommeong/utilities/app_routes.dart';
import 'package:bommeong/views/root/root_screen.dart';


List<GetPage> appPages = [
  GetPage(
    name: Routes.ROOT,
    page: () => const RootScreen(),
    binding: RootBinding(),
  ),
];