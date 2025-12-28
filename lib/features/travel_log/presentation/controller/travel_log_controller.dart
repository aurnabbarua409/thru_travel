import 'package:get/get.dart';

class TravelLogController extends GetxController {
  final logs = [
    {"title": "Login", "year": 2025},
    {"title": "Logout", "year": 2025},
    {"title": "Signup", "year": 2025},
    {"title": "Payment", "year": 2024},
    {"title": "Payment", "year": 2024},
  ];

  Map<int, List<Map<String, dynamic>>> get groupedLogs {
    final Map<int, List<Map<String, dynamic>>> grouped = {};

    for (var log in logs) {
      final year = log['year'] as int;
      grouped.putIfAbsent(year, () => []);
      grouped[year]!.add(log);
    }

    return grouped;
  }
}
