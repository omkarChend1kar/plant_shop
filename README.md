# Plant Shop 

## Features

- Displays a list of plants with images, names, prices, and like/add icons.
- Data is loaded from a local JSON file.
- Uses Cubit for state management and business logic.

## Installation
### Steps

1. Clone the repository:

    ```bash
    git clone https://github.com/omkarChend1kar/plant_shop
    ```

2. Navigate to the project directory:

    ```bash
    cd plant_shop
    ```

3. Get the dependencies:

    ```bash
    flutter pub get
    ```

4. Run the app:

    ```bash
    flutter run
    ```

## Usage

Once the app is running, you will see a grid of plants. Each grid item displays an image of the plant, its name, price, and icons for liking or adding the plant.

## Technologies

- Flutter
- Dart
- Cubit (part of the Bloc library)

## Project Structure

```plaintext
lib/
├── services/
│   ├── repositories/
│   │   └── plant_repository.dart
│   ├── models/
│   │   └── plant.dart
├── views/
│   ├── state/
│   │   └── get-plant_cubit.dart
│   │   └── get_plant_state.dart
│   ├── pages/
│   │   └── plant_list_page.dart
│   ├── widgets/
│   │   └── plant_grid_item.dart
└── main.dart

