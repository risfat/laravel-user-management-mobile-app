import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_data.freezed.dart';
part 'dashboard_data.g.dart';

@freezed
class DashboardData with _$DashboardData {
  factory DashboardData({
    required MonthlyUsers monthlyUsers,
    required WeeklyActivity weeklyActivity,
    required Stats stats,
    required String userName,
  }) = _DashboardData;

  factory DashboardData.fromJson(Map<String, dynamic> json) =>
      _$DashboardDataFromJson(json);
}

@freezed
class MonthlyUsers with _$MonthlyUsers {
  factory MonthlyUsers({
    required List<String> months,
    required List<int> counts,
  }) = _MonthlyUsers;

  factory MonthlyUsers.fromJson(Map<String, dynamic> json) =>
      _$MonthlyUsersFromJson(json);
}

@freezed
class WeeklyActivity with _$WeeklyActivity {
  factory WeeklyActivity({
    required List<String> days,
    required List<int> logins,
    required List<int> registrations,
  }) = _WeeklyActivity;

  factory WeeklyActivity.fromJson(Map<String, dynamic> json) =>
      _$WeeklyActivityFromJson(json);
}

@freezed
class Stats with _$Stats {
  factory Stats({
    required int total,
    required int verified,
    required int unverified,
    required int thisMonth,
    required int lastMonth,
    required double growth,
  }) = _Stats;

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
}
