import 'package:laravel_user_management_mobile_app/domain/entities/user.dart';

class UserModel extends User {
  final String? emailVerifiedAt;
  final String? createdAt;
  final String? updatedAt;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? address;
  final String? city;
  final String? state;
  final String? country;
  final String? zipCode;
  final String? dateOfBirth;
  final String? gender;
  final String? bio;
  final bool status;
  final String? profilePhotoPath;
  final String? twoFactorConfirmedAt;
  final String? profilePhotoUrl;
  final String? fullName;

  const UserModel({
    required int id,
    required String name,
    required String email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.firstName,
    this.lastName,
    this.phone,
    this.address,
    this.city,
    this.state,
    this.country,
    this.zipCode,
    this.dateOfBirth,
    this.gender,
    this.bio,
    required this.status,
    this.profilePhotoPath,
    this.twoFactorConfirmedAt,
    this.profilePhotoUrl,
    this.fullName,
  }) : super(
          id: id,
          name: name,
          email: email,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'] ?? 'Unknown',
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phone: json['phone'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      zipCode: json['zip_code'],
      dateOfBirth: json['date_of_birth'],
      gender: json['gender'],
      bio: json['bio'],
      status: json['status'],
      profilePhotoPath: json['profile_photo_path'],
      twoFactorConfirmedAt: json['two_factor_confirmed_at'],
      profilePhotoUrl: json['profile_photo_url'],
      fullName: json['full_name'] ?? json['name'] ?? 'Unknown',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'address': address,
      'city': city,
      'state': state,
      'country': country,
      'zip_code': zipCode,
      'date_of_birth': dateOfBirth,
      'gender': gender,
      'bio': bio,
      'status': status,
      'profile_photo_path': profilePhotoPath,
      'two_factor_confirmed_at': twoFactorConfirmedAt,
      'profile_photo_url': profilePhotoUrl,
      'full_name': fullName,
    };
  }
}
