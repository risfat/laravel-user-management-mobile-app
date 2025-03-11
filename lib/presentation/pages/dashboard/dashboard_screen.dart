import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../core/config/routes.dart';
import '../../../data/models/dashboard_data.dart';
import '../../bloc/authenticator_watcher/authenticator_watcher_bloc.dart';
import '../../bloc/dashboard/dashboard_bloc.dart';
import '../../cubit/theme/theme_cubit.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<DashboardBloc>()
        .add(const DashboardEvent.fetchDashboardData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Dashboard'),
        actions: [
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) {
              return IconButton(
                icon: Icon(
                  state is ThemeLight ? Icons.dark_mode : Icons.light_mode,
                ),
                onPressed: () {
                  context.read<ThemeCubit>().changeTheme();
                },
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthenticatorWatcherBloc>().add(
                    const AuthenticatorWatcherEvent.signOut(),
                  );
              context.replaceNamed(AppRoutes.loginRouteName);
            },
          ),
        ],
      ),
      body: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (data) => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back, ${data.userName}!',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ).animate().fadeIn(duration: 600.ms).slideX(),
                    const SizedBox(height: 24),
                    _buildStatCards(data.stats),
                    const SizedBox(height: 24),
                    _buildChart(data.monthlyUsers, data.weeklyActivity),
                    const SizedBox(height: 24),
                    _buildCalendar(),
                    const SizedBox(height: 24),
                    _buildDailyActivities(),
                  ],
                ),
              ),
            ),
            error: (message) => Center(child: Text('Error: $message')),
          );
        },
      ),
    );
  }

  Widget _buildStatCards(Stats stats) {
    return Row(
      children: [
        _buildStatCard(
          'Total Users',
          stats.total.toString(),
          Icons.people,
          Colors.blue,
          onTap: () {
            context.pushNamed(AppRoutes.usersRouteName);
          },
        ),
        const SizedBox(width: 16),
        _buildStatCard(
          'Verified Users',
          stats.verified.toString(),
          Icons.verified_user,
          Colors.green,
        ),
      ],
    ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.2);
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color,
      {VoidCallback? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 4,
          color: color.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(icon, color: color),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChart(MonthlyUsers monthlyUsers, WeeklyActivity weeklyActivity) {
    return SizedBox(
      height: 300,
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Analytics Overview',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Row(
                  children: [
                    Expanded(child: _buildLineChart(monthlyUsers)),
                    const SizedBox(width: 16),
                    Expanded(child: _buildBarChart(weeklyActivity)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(duration: 1000.ms).slideX();
  }

  Widget _buildLineChart(MonthlyUsers monthlyUsers) {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: false),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index >= 0 && index < monthlyUsers.months.length) {
                  return Text(monthlyUsers.months[index]);
                }
                return const Text('');
              },
            ),
          ),
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: List.generate(
              monthlyUsers.months.length,
              (index) => FlSpot(
                  index.toDouble(), monthlyUsers.counts[index].toDouble()),
            ),
            isCurved: true,
            color: Colors.blue,
            barWidth: 4,
            dotData: const FlDotData(show: false),
            belowBarData:
                BarAreaData(show: true, color: Colors.blue.withOpacity(0.1)),
          ),
        ],
      ),
    );
  }

  Widget _buildBarChart(WeeklyActivity weeklyActivity) {
    return BarChart(
      BarChartData(
        gridData: const FlGridData(show: false),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index >= 0 && index < weeklyActivity.days.length) {
                  return Text(weeklyActivity.days[index]);
                }
                return const Text('');
              },
            ),
          ),
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        borderData: FlBorderData(show: false),
        barGroups: List.generate(
          weeklyActivity.days.length,
          (index) => BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: weeklyActivity.logins[index].toDouble(),
                color: Colors.blue,
              ),
              BarChartRodData(
                toY: weeklyActivity.registrations[index].toDouble(),
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Calendar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TableCalendar(
              firstDay: DateTime(2023, 1, 1),
              lastDay: DateTime.now(),
              focusedDay: DateTime.now(),
              calendarFormat: CalendarFormat.month,
              headerStyle: const HeaderStyle(formatButtonVisible: false),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 1000.ms).slideY(begin: 0.2);
  }

  Widget _buildDailyActivities() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Daily Activities',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildActivityItem('Team Meeting', '10:00 AM', Icons.group),
            _buildActivityItem('Project Deadline', '2:00 PM', Icons.assignment),
            _buildActivityItem('Client Call', '4:30 PM', Icons.phone),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 1200.ms).slideY(begin: 0.2);
  }

  Widget _buildActivityItem(String title, String time, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(time, style: TextStyle(color: Colors.grey[600])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
