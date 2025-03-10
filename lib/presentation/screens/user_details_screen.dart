import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:laravel_user_management_mobile_app/presentation/bloc/user/user_bloc.dart';
import 'package:laravel_user_management_mobile_app/presentation/bloc/user/user_event.dart';
import 'package:laravel_user_management_mobile_app/presentation/bloc/user/user_state.dart';
import 'package:laravel_user_management_mobile_app/presentation/screens/update_user_page.dart';

import '../../data/models/user_model.dart';

class UserDetailsScreen extends StatefulWidget {
  final int userId;

  const UserDetailsScreen({Key? key, required this.userId}) : super(key: key);

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(GetUserEvent(widget.userId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.selectedUser != null) {
            return _buildUserDetails(state.selectedUser!);
          } else if (state.error != null) {
            return Center(child: Text(state.error!));
          } else {
            return const Center(child: Text('User not found'));
          }
        },
      ),
    );
  }

  Widget _buildUserDetails(UserModel user) {
    return CustomScrollView(
      slivers: [
        _buildSliverAppBar(user),
        SliverToBoxAdapter(
          child: Column(
            children: [
              _buildUserInfoCard(user),
              _buildActionButtons(user),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSliverAppBar(UserModel user) {
    return SliverAppBar(
      expandedHeight: 200,
      foregroundColor: Colors.white,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          user.fullName ?? 'N/A',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.white),
        ),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColor.withOpacity(0.7),
              ],
            ),
          ),
          child: Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white,
              child: Text(
                user.name[0].toUpperCase(),
                style: TextStyle(
                  fontSize: 40,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserInfoCard(UserModel user) {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Personal Information'),
            _buildInfoRow(
                Icons.person, 'Full Name', user.fullName ?? "N/A"),
            _buildInfoRow(Icons.email, 'Email', user.email),
            _buildInfoRow(Icons.phone, 'Phone', user.phone ?? 'Not provided'),
            _buildInfoRow(
                Icons.cake,
                'Date of Birth',
                user.dateOfBirth != null
                    ? DateFormat('MMMM d, yyyy')
                        .format(DateTime.parse(user.dateOfBirth!))
                    : 'Not provided'),
            _buildInfoRow(
                Icons.person_outline, 'Gender', user.gender ?? 'Not provided'),
            const Divider(height: 32),
            _buildSectionTitle('Contact Information'),
            _buildInfoRow(
                Icons.location_on, 'Address', user.address ?? 'Not provided'),
            _buildInfoRow(
                Icons.location_city, 'City', user.city ?? 'Not provided'),
            _buildInfoRow(Icons.map, 'State', user.state ?? 'Not provided'),
            _buildInfoRow(
                Icons.flag, 'Country', user.country ?? 'Not provided'),
            _buildInfoRow(Icons.local_post_office, 'Zip Code',
                user.zipCode ?? 'Not provided'),
            const Divider(height: 32),
            _buildSectionTitle('Account Information'),
            _buildInfoRow(Icons.verified_user, 'Status',
                user.status ? 'Active' : 'Inactive'),
            _buildInfoRow(
                Icons.calendar_today,
                'Created At',
                user.createdAt != null
                    ? DateFormat('MMMM d, yyyy')
                        .format(DateTime.parse(user.createdAt!))
                    : 'Not available'),
            _buildInfoRow(
                Icons.update,
                'Last Updated',
                user.updatedAt != null
                    ? DateFormat('MMMM d, yyyy')
                        .format(DateTime.parse(user.updatedAt!))
                    : 'Not available'),
            if (user.bio != null && user.bio!.isNotEmpty) ...[
              const Divider(height: 32),
              _buildSectionTitle('Bio'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(user.bio!, style: const TextStyle(fontSize: 16)),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Theme.of(context).primaryColor, size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: const TextStyle(fontSize: 14, color: Colors.grey)),
                const SizedBox(height: 4),
                Text(value,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(UserModel user) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => UpdateUserPage(user: user),
                  ),
                );
              },
              icon: const Icon(Icons.edit),
              label: const Text('Edit User'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {
                _showDeleteConfirmation(context, user.id);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
              label: const Text(
                'Delete User',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, int userId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: const Text('Are you sure you want to delete this user?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                context.read<UserBloc>().add(DeleteUserEvent(userId));
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
