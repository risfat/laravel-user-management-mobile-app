// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DashboardData _$DashboardDataFromJson(Map<String, dynamic> json) {
  return _DashboardData.fromJson(json);
}

/// @nodoc
mixin _$DashboardData {
  MonthlyUsers get monthlyUsers => throw _privateConstructorUsedError;
  WeeklyActivity get weeklyActivity => throw _privateConstructorUsedError;
  Stats get stats => throw _privateConstructorUsedError;

  /// Serializes this DashboardData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardDataCopyWith<DashboardData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardDataCopyWith<$Res> {
  factory $DashboardDataCopyWith(
          DashboardData value, $Res Function(DashboardData) then) =
      _$DashboardDataCopyWithImpl<$Res, DashboardData>;
  @useResult
  $Res call(
      {MonthlyUsers monthlyUsers, WeeklyActivity weeklyActivity, Stats stats});

  $MonthlyUsersCopyWith<$Res> get monthlyUsers;
  $WeeklyActivityCopyWith<$Res> get weeklyActivity;
  $StatsCopyWith<$Res> get stats;
}

/// @nodoc
class _$DashboardDataCopyWithImpl<$Res, $Val extends DashboardData>
    implements $DashboardDataCopyWith<$Res> {
  _$DashboardDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthlyUsers = null,
    Object? weeklyActivity = null,
    Object? stats = null,
  }) {
    return _then(_value.copyWith(
      monthlyUsers: null == monthlyUsers
          ? _value.monthlyUsers
          : monthlyUsers // ignore: cast_nullable_to_non_nullable
              as MonthlyUsers,
      weeklyActivity: null == weeklyActivity
          ? _value.weeklyActivity
          : weeklyActivity // ignore: cast_nullable_to_non_nullable
              as WeeklyActivity,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as Stats,
    ) as $Val);
  }

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MonthlyUsersCopyWith<$Res> get monthlyUsers {
    return $MonthlyUsersCopyWith<$Res>(_value.monthlyUsers, (value) {
      return _then(_value.copyWith(monthlyUsers: value) as $Val);
    });
  }

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeeklyActivityCopyWith<$Res> get weeklyActivity {
    return $WeeklyActivityCopyWith<$Res>(_value.weeklyActivity, (value) {
      return _then(_value.copyWith(weeklyActivity: value) as $Val);
    });
  }

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatsCopyWith<$Res> get stats {
    return $StatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardDataImplCopyWith<$Res>
    implements $DashboardDataCopyWith<$Res> {
  factory _$$DashboardDataImplCopyWith(
          _$DashboardDataImpl value, $Res Function(_$DashboardDataImpl) then) =
      __$$DashboardDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MonthlyUsers monthlyUsers, WeeklyActivity weeklyActivity, Stats stats});

  @override
  $MonthlyUsersCopyWith<$Res> get monthlyUsers;
  @override
  $WeeklyActivityCopyWith<$Res> get weeklyActivity;
  @override
  $StatsCopyWith<$Res> get stats;
}

/// @nodoc
class __$$DashboardDataImplCopyWithImpl<$Res>
    extends _$DashboardDataCopyWithImpl<$Res, _$DashboardDataImpl>
    implements _$$DashboardDataImplCopyWith<$Res> {
  __$$DashboardDataImplCopyWithImpl(
      _$DashboardDataImpl _value, $Res Function(_$DashboardDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? monthlyUsers = null,
    Object? weeklyActivity = null,
    Object? stats = null,
  }) {
    return _then(_$DashboardDataImpl(
      monthlyUsers: null == monthlyUsers
          ? _value.monthlyUsers
          : monthlyUsers // ignore: cast_nullable_to_non_nullable
              as MonthlyUsers,
      weeklyActivity: null == weeklyActivity
          ? _value.weeklyActivity
          : weeklyActivity // ignore: cast_nullable_to_non_nullable
              as WeeklyActivity,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as Stats,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardDataImpl implements _DashboardData {
  _$DashboardDataImpl(
      {required this.monthlyUsers,
      required this.weeklyActivity,
      required this.stats});

  factory _$DashboardDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardDataImplFromJson(json);

  @override
  final MonthlyUsers monthlyUsers;
  @override
  final WeeklyActivity weeklyActivity;
  @override
  final Stats stats;

  @override
  String toString() {
    return 'DashboardData(monthlyUsers: $monthlyUsers, weeklyActivity: $weeklyActivity, stats: $stats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardDataImpl &&
            (identical(other.monthlyUsers, monthlyUsers) ||
                other.monthlyUsers == monthlyUsers) &&
            (identical(other.weeklyActivity, weeklyActivity) ||
                other.weeklyActivity == weeklyActivity) &&
            (identical(other.stats, stats) || other.stats == stats));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, monthlyUsers, weeklyActivity, stats);

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardDataImplCopyWith<_$DashboardDataImpl> get copyWith =>
      __$$DashboardDataImplCopyWithImpl<_$DashboardDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardDataImplToJson(
      this,
    );
  }
}

abstract class _DashboardData implements DashboardData {
  factory _DashboardData(
      {required final MonthlyUsers monthlyUsers,
      required final WeeklyActivity weeklyActivity,
      required final Stats stats}) = _$DashboardDataImpl;

  factory _DashboardData.fromJson(Map<String, dynamic> json) =
      _$DashboardDataImpl.fromJson;

  @override
  MonthlyUsers get monthlyUsers;
  @override
  WeeklyActivity get weeklyActivity;
  @override
  Stats get stats;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardDataImplCopyWith<_$DashboardDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MonthlyUsers _$MonthlyUsersFromJson(Map<String, dynamic> json) {
  return _MonthlyUsers.fromJson(json);
}

/// @nodoc
mixin _$MonthlyUsers {
  List<String> get months => throw _privateConstructorUsedError;
  List<int> get counts => throw _privateConstructorUsedError;

  /// Serializes this MonthlyUsers to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonthlyUsers
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyUsersCopyWith<MonthlyUsers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyUsersCopyWith<$Res> {
  factory $MonthlyUsersCopyWith(
          MonthlyUsers value, $Res Function(MonthlyUsers) then) =
      _$MonthlyUsersCopyWithImpl<$Res, MonthlyUsers>;
  @useResult
  $Res call({List<String> months, List<int> counts});
}

/// @nodoc
class _$MonthlyUsersCopyWithImpl<$Res, $Val extends MonthlyUsers>
    implements $MonthlyUsersCopyWith<$Res> {
  _$MonthlyUsersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyUsers
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? months = null,
    Object? counts = null,
  }) {
    return _then(_value.copyWith(
      months: null == months
          ? _value.months
          : months // ignore: cast_nullable_to_non_nullable
              as List<String>,
      counts: null == counts
          ? _value.counts
          : counts // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonthlyUsersImplCopyWith<$Res>
    implements $MonthlyUsersCopyWith<$Res> {
  factory _$$MonthlyUsersImplCopyWith(
          _$MonthlyUsersImpl value, $Res Function(_$MonthlyUsersImpl) then) =
      __$$MonthlyUsersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> months, List<int> counts});
}

/// @nodoc
class __$$MonthlyUsersImplCopyWithImpl<$Res>
    extends _$MonthlyUsersCopyWithImpl<$Res, _$MonthlyUsersImpl>
    implements _$$MonthlyUsersImplCopyWith<$Res> {
  __$$MonthlyUsersImplCopyWithImpl(
      _$MonthlyUsersImpl _value, $Res Function(_$MonthlyUsersImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthlyUsers
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? months = null,
    Object? counts = null,
  }) {
    return _then(_$MonthlyUsersImpl(
      months: null == months
          ? _value._months
          : months // ignore: cast_nullable_to_non_nullable
              as List<String>,
      counts: null == counts
          ? _value._counts
          : counts // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlyUsersImpl implements _MonthlyUsers {
  _$MonthlyUsersImpl(
      {required final List<String> months, required final List<int> counts})
      : _months = months,
        _counts = counts;

  factory _$MonthlyUsersImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyUsersImplFromJson(json);

  final List<String> _months;
  @override
  List<String> get months {
    if (_months is EqualUnmodifiableListView) return _months;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_months);
  }

  final List<int> _counts;
  @override
  List<int> get counts {
    if (_counts is EqualUnmodifiableListView) return _counts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_counts);
  }

  @override
  String toString() {
    return 'MonthlyUsers(months: $months, counts: $counts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyUsersImpl &&
            const DeepCollectionEquality().equals(other._months, _months) &&
            const DeepCollectionEquality().equals(other._counts, _counts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_months),
      const DeepCollectionEquality().hash(_counts));

  /// Create a copy of MonthlyUsers
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyUsersImplCopyWith<_$MonthlyUsersImpl> get copyWith =>
      __$$MonthlyUsersImplCopyWithImpl<_$MonthlyUsersImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyUsersImplToJson(
      this,
    );
  }
}

abstract class _MonthlyUsers implements MonthlyUsers {
  factory _MonthlyUsers(
      {required final List<String> months,
      required final List<int> counts}) = _$MonthlyUsersImpl;

  factory _MonthlyUsers.fromJson(Map<String, dynamic> json) =
      _$MonthlyUsersImpl.fromJson;

  @override
  List<String> get months;
  @override
  List<int> get counts;

  /// Create a copy of MonthlyUsers
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyUsersImplCopyWith<_$MonthlyUsersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WeeklyActivity _$WeeklyActivityFromJson(Map<String, dynamic> json) {
  return _WeeklyActivity.fromJson(json);
}

/// @nodoc
mixin _$WeeklyActivity {
  List<String> get days => throw _privateConstructorUsedError;
  List<int> get logins => throw _privateConstructorUsedError;
  List<int> get registrations => throw _privateConstructorUsedError;

  /// Serializes this WeeklyActivity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeeklyActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeeklyActivityCopyWith<WeeklyActivity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeklyActivityCopyWith<$Res> {
  factory $WeeklyActivityCopyWith(
          WeeklyActivity value, $Res Function(WeeklyActivity) then) =
      _$WeeklyActivityCopyWithImpl<$Res, WeeklyActivity>;
  @useResult
  $Res call({List<String> days, List<int> logins, List<int> registrations});
}

/// @nodoc
class _$WeeklyActivityCopyWithImpl<$Res, $Val extends WeeklyActivity>
    implements $WeeklyActivityCopyWith<$Res> {
  _$WeeklyActivityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeklyActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = null,
    Object? logins = null,
    Object? registrations = null,
  }) {
    return _then(_value.copyWith(
      days: null == days
          ? _value.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<String>,
      logins: null == logins
          ? _value.logins
          : logins // ignore: cast_nullable_to_non_nullable
              as List<int>,
      registrations: null == registrations
          ? _value.registrations
          : registrations // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeeklyActivityImplCopyWith<$Res>
    implements $WeeklyActivityCopyWith<$Res> {
  factory _$$WeeklyActivityImplCopyWith(_$WeeklyActivityImpl value,
          $Res Function(_$WeeklyActivityImpl) then) =
      __$$WeeklyActivityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> days, List<int> logins, List<int> registrations});
}

/// @nodoc
class __$$WeeklyActivityImplCopyWithImpl<$Res>
    extends _$WeeklyActivityCopyWithImpl<$Res, _$WeeklyActivityImpl>
    implements _$$WeeklyActivityImplCopyWith<$Res> {
  __$$WeeklyActivityImplCopyWithImpl(
      _$WeeklyActivityImpl _value, $Res Function(_$WeeklyActivityImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeeklyActivity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = null,
    Object? logins = null,
    Object? registrations = null,
  }) {
    return _then(_$WeeklyActivityImpl(
      days: null == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<String>,
      logins: null == logins
          ? _value._logins
          : logins // ignore: cast_nullable_to_non_nullable
              as List<int>,
      registrations: null == registrations
          ? _value._registrations
          : registrations // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeeklyActivityImpl implements _WeeklyActivity {
  _$WeeklyActivityImpl(
      {required final List<String> days,
      required final List<int> logins,
      required final List<int> registrations})
      : _days = days,
        _logins = logins,
        _registrations = registrations;

  factory _$WeeklyActivityImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeeklyActivityImplFromJson(json);

  final List<String> _days;
  @override
  List<String> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  final List<int> _logins;
  @override
  List<int> get logins {
    if (_logins is EqualUnmodifiableListView) return _logins;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_logins);
  }

  final List<int> _registrations;
  @override
  List<int> get registrations {
    if (_registrations is EqualUnmodifiableListView) return _registrations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_registrations);
  }

  @override
  String toString() {
    return 'WeeklyActivity(days: $days, logins: $logins, registrations: $registrations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeklyActivityImpl &&
            const DeepCollectionEquality().equals(other._days, _days) &&
            const DeepCollectionEquality().equals(other._logins, _logins) &&
            const DeepCollectionEquality()
                .equals(other._registrations, _registrations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_days),
      const DeepCollectionEquality().hash(_logins),
      const DeepCollectionEquality().hash(_registrations));

  /// Create a copy of WeeklyActivity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeklyActivityImplCopyWith<_$WeeklyActivityImpl> get copyWith =>
      __$$WeeklyActivityImplCopyWithImpl<_$WeeklyActivityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeeklyActivityImplToJson(
      this,
    );
  }
}

abstract class _WeeklyActivity implements WeeklyActivity {
  factory _WeeklyActivity(
      {required final List<String> days,
      required final List<int> logins,
      required final List<int> registrations}) = _$WeeklyActivityImpl;

  factory _WeeklyActivity.fromJson(Map<String, dynamic> json) =
      _$WeeklyActivityImpl.fromJson;

  @override
  List<String> get days;
  @override
  List<int> get logins;
  @override
  List<int> get registrations;

  /// Create a copy of WeeklyActivity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeklyActivityImplCopyWith<_$WeeklyActivityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Stats _$StatsFromJson(Map<String, dynamic> json) {
  return _Stats.fromJson(json);
}

/// @nodoc
mixin _$Stats {
  int get total => throw _privateConstructorUsedError;
  int get verified => throw _privateConstructorUsedError;
  int get unverified => throw _privateConstructorUsedError;
  int get thisMonth => throw _privateConstructorUsedError;
  int get lastMonth => throw _privateConstructorUsedError;
  double get growth => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;

  /// Serializes this Stats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Stats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatsCopyWith<Stats> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsCopyWith<$Res> {
  factory $StatsCopyWith(Stats value, $Res Function(Stats) then) =
      _$StatsCopyWithImpl<$Res, Stats>;
  @useResult
  $Res call(
      {int total,
      int verified,
      int unverified,
      int thisMonth,
      int lastMonth,
      double growth,
      String userName});
}

/// @nodoc
class _$StatsCopyWithImpl<$Res, $Val extends Stats>
    implements $StatsCopyWith<$Res> {
  _$StatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Stats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? verified = null,
    Object? unverified = null,
    Object? thisMonth = null,
    Object? lastMonth = null,
    Object? growth = null,
    Object? userName = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as int,
      unverified: null == unverified
          ? _value.unverified
          : unverified // ignore: cast_nullable_to_non_nullable
              as int,
      thisMonth: null == thisMonth
          ? _value.thisMonth
          : thisMonth // ignore: cast_nullable_to_non_nullable
              as int,
      lastMonth: null == lastMonth
          ? _value.lastMonth
          : lastMonth // ignore: cast_nullable_to_non_nullable
              as int,
      growth: null == growth
          ? _value.growth
          : growth // ignore: cast_nullable_to_non_nullable
              as double,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatsImplCopyWith<$Res> implements $StatsCopyWith<$Res> {
  factory _$$StatsImplCopyWith(
          _$StatsImpl value, $Res Function(_$StatsImpl) then) =
      __$$StatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int total,
      int verified,
      int unverified,
      int thisMonth,
      int lastMonth,
      double growth,
      String userName});
}

/// @nodoc
class __$$StatsImplCopyWithImpl<$Res>
    extends _$StatsCopyWithImpl<$Res, _$StatsImpl>
    implements _$$StatsImplCopyWith<$Res> {
  __$$StatsImplCopyWithImpl(
      _$StatsImpl _value, $Res Function(_$StatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Stats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? verified = null,
    Object? unverified = null,
    Object? thisMonth = null,
    Object? lastMonth = null,
    Object? growth = null,
    Object? userName = null,
  }) {
    return _then(_$StatsImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      verified: null == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as int,
      unverified: null == unverified
          ? _value.unverified
          : unverified // ignore: cast_nullable_to_non_nullable
              as int,
      thisMonth: null == thisMonth
          ? _value.thisMonth
          : thisMonth // ignore: cast_nullable_to_non_nullable
              as int,
      lastMonth: null == lastMonth
          ? _value.lastMonth
          : lastMonth // ignore: cast_nullable_to_non_nullable
              as int,
      growth: null == growth
          ? _value.growth
          : growth // ignore: cast_nullable_to_non_nullable
              as double,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatsImpl implements _Stats {
  _$StatsImpl(
      {required this.total,
      required this.verified,
      required this.unverified,
      required this.thisMonth,
      required this.lastMonth,
      required this.growth,
      required this.userName});

  factory _$StatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatsImplFromJson(json);

  @override
  final int total;
  @override
  final int verified;
  @override
  final int unverified;
  @override
  final int thisMonth;
  @override
  final int lastMonth;
  @override
  final double growth;
  @override
  final String userName;

  @override
  String toString() {
    return 'Stats(total: $total, verified: $verified, unverified: $unverified, thisMonth: $thisMonth, lastMonth: $lastMonth, growth: $growth, userName: $userName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatsImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.unverified, unverified) ||
                other.unverified == unverified) &&
            (identical(other.thisMonth, thisMonth) ||
                other.thisMonth == thisMonth) &&
            (identical(other.lastMonth, lastMonth) ||
                other.lastMonth == lastMonth) &&
            (identical(other.growth, growth) || other.growth == growth) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, verified, unverified,
      thisMonth, lastMonth, growth, userName);

  /// Create a copy of Stats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatsImplCopyWith<_$StatsImpl> get copyWith =>
      __$$StatsImplCopyWithImpl<_$StatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatsImplToJson(
      this,
    );
  }
}

abstract class _Stats implements Stats {
  factory _Stats(
      {required final int total,
      required final int verified,
      required final int unverified,
      required final int thisMonth,
      required final int lastMonth,
      required final double growth,
      required final String userName}) = _$StatsImpl;

  factory _Stats.fromJson(Map<String, dynamic> json) = _$StatsImpl.fromJson;

  @override
  int get total;
  @override
  int get verified;
  @override
  int get unverified;
  @override
  int get thisMonth;
  @override
  int get lastMonth;
  @override
  double get growth;
  @override
  String get userName;

  /// Create a copy of Stats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatsImplCopyWith<_$StatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
