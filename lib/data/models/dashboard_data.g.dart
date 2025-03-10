// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DashboardDataImpl _$$DashboardDataImplFromJson(Map<String, dynamic> json) =>
    _$DashboardDataImpl(
      monthlyUsers:
          MonthlyUsers.fromJson(json['monthlyUsers'] as Map<String, dynamic>),
      weeklyActivity: WeeklyActivity.fromJson(
          json['weeklyActivity'] as Map<String, dynamic>),
      stats: Stats.fromJson(json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DashboardDataImplToJson(_$DashboardDataImpl instance) =>
    <String, dynamic>{
      'monthlyUsers': instance.monthlyUsers,
      'weeklyActivity': instance.weeklyActivity,
      'stats': instance.stats,
    };

_$MonthlyUsersImpl _$$MonthlyUsersImplFromJson(Map<String, dynamic> json) =>
    _$MonthlyUsersImpl(
      months:
          (json['months'] as List<dynamic>).map((e) => e as String).toList(),
      counts: (json['counts'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$MonthlyUsersImplToJson(_$MonthlyUsersImpl instance) =>
    <String, dynamic>{
      'months': instance.months,
      'counts': instance.counts,
    };

_$WeeklyActivityImpl _$$WeeklyActivityImplFromJson(Map<String, dynamic> json) =>
    _$WeeklyActivityImpl(
      days: (json['days'] as List<dynamic>).map((e) => e as String).toList(),
      logins: (json['logins'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      registrations: (json['registrations'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$WeeklyActivityImplToJson(
        _$WeeklyActivityImpl instance) =>
    <String, dynamic>{
      'days': instance.days,
      'logins': instance.logins,
      'registrations': instance.registrations,
    };

_$StatsImpl _$$StatsImplFromJson(Map<String, dynamic> json) => _$StatsImpl(
      total: (json['total'] as num).toInt(),
      verified: (json['verified'] as num).toInt(),
      unverified: (json['unverified'] as num).toInt(),
      thisMonth: (json['thisMonth'] as num).toInt(),
      lastMonth: (json['lastMonth'] as num).toInt(),
      growth: (json['growth'] as num).toDouble(),
    );

Map<String, dynamic> _$$StatsImplToJson(_$StatsImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'verified': instance.verified,
      'unverified': instance.unverified,
      'thisMonth': instance.thisMonth,
      'lastMonth': instance.lastMonth,
      'growth': instance.growth,
    };
