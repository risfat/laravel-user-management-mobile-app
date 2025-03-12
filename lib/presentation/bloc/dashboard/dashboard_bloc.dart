import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/models/dashboard_data.dart';
import '../../../domain/repositories/dashboard_repository.dart';

part 'dashboard_bloc.freezed.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardRepository _repository;

  DashboardBloc(this._repository) : super(const DashboardState.initial()) {
    on<DashboardEvent>((event, emit) async {
      await event.when(
        fetchDashboardData: () async {
          emit(const DashboardState.loading());
          try {
            print(
                "\n\n =============Fetching dashboard data...(Level 1)================  \n\n");
            final data = await _repository.getDashboardData();
            data.fold(
                (_) => emit(const DashboardState.error(
                    'Failed to fetch dashboard data.')),
                (DashboardData dashboardData) =>
                    emit(DashboardState.loaded(dashboardData)));
          } catch (e) {
            emit(DashboardState.error(e.toString()));
          }
        },
      );
    });
  }
}
