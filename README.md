
# Laravel User Management Mobile App

## Project Overview

The Laravel User Management Mobile App is a Flutter-based application designed to manage user data and interactions efficiently. This app leverages the power of the Flutter framework to provide a seamless cross-platform experience, supporting Android, iOS, web, Linux, macOS, and Windows platforms. The app integrates with a backend service, presumably built with Laravel, to handle user management functionalities.

## Features

- **User Authentication**: Secure login and registration functionalities.
- **Profile Management**: Users can view and update their profile information.
- **Network Connectivity**: Utilizes the `connectivity_plus` package to monitor network status and handle connectivity changes.
- **State Management**: Implements the BLoC pattern using `flutter_bloc` for efficient state management.
- **Data Persistence**: Uses `shared_preferences` and `hive_flutter` for local data storage.
- **UI Components**: Rich UI components with `flutter_spinkit`, `google_fonts`, and `font_awesome_flutter`.
- **Form Validation**: Validates user input using `form_field_validator`.
- **Routing**: Manages navigation with `go_router`.
- **Logging**: Provides logging capabilities with the `logger` package.
- **Charts and Calendars**: Visualizes data using `fl_chart` and `table_calendar`.

## Getting Started

To get started with this project, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/risfat/laravel-user-management-mobile-app
   cd laravel-user-management-mobile-app
   ```

2. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the App**:
   ```bash
   flutter run
   ```

## Project Structure

- **lib**: Contains the main source code of the application.
    - **core**: Core configurations and utility classes.
    - **data**: Data-related classes and models.
    - **di**: Dependency injection setup using `get_it`.
    - **domain**: Domain-specific entities and repositories.
    - **presentation**: UI components, BLoCs, and widgets.

- **test**: Contains unit and widget tests to ensure the app's functionality.

## Dependencies

- **Main Dependencies**:
    - `flutter`: Core SDK for building Flutter applications.
    - `connectivity_plus`: Manages network connectivity.
    - `shared_preferences`: Stores simple data persistently.
    - `dio`: Handles HTTP requests.
    - `flutter_bloc`: Implements the BLoC pattern for state management.
    - `hive_flutter`: Lightweight and fast key-value database.
    - `go_router`: Simplifies navigation and routing.

- **Dev Dependencies**:
    - `flutter_test`: Provides testing utilities.
    - `very_good_analysis`: Ensures code quality and style.
    - `mocktail` and `mockito`: Used for mocking in tests.
    - `build_runner`: Generates code for data classes and serialization.

## Configuration

- **Versioning**: The app follows semantic versioning. The current version is `1.0.0+1`.
- **Environment**: Compatible with Dart SDK `>=3.0.6 <4.0.0`.

## Additional Information

- **Platform Support**: The app is designed to run on multiple platforms, including Android, iOS, web, Linux, macOS, and Windows.
- **Testing**: The project includes a suite of tests to ensure reliability and correctness.
- **Customization**: The app can be customized by modifying the Flutter widgets and BLoC components in the `presentation` layer.

## Contribution

Contributions are welcome! Please fork the repository and submit a pull request for any improvements or bug fixes.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.

---