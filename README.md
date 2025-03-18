# Pokémon TCG App

## Overview
The **Pokémon TCG App** is a Flutter application that fetches and displays Pokémon Trading Card Game (TCG) cards using the [Pokémon TCG API](https://pokemontcg.io/). Users can browse through a list of Pokémon cards and view an enlarged version of any card by tapping on it.

## Features
- Fetches Pokémon TCG cards from an API.
- Displays a scrollable list of Pokémon cards with images and names.
- Allows users to tap on a card to view a larger version.
- Uses **Dio** for API calls to enhance performance and error handling.

## Technologies Used
- **Flutter** for the mobile UI framework.
- **Dio** for handling API requests.
- **HTTP package** for additional networking capabilities.
- **InteractiveViewer** for zooming in on Pokémon card images.

## Installation & Setup
1. Clone this repository:
   ```sh
   git clone https://github.com/your-repo/pokemon-tcg-app.git
   ```
2. Navigate to the project folder:
   ```sh
   cd pokemon-tcg-app
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the application:
   ```sh
   flutter run
   ```

## File Structure
- `main.dart` – Entry point of the application.
- `PokemonListScreen` – Fetches Pokémon cards and displays them in a list.
- `FullImageScreen` – Displays a full-screen interactive Pokémon card image.

## Future Enhancements
- Implement search functionality to find specific Pokémon cards.
- Add filtering options by Pokémon type, rarity, or set.
- Include caching mechanisms for offline browsing.
- Improve UI design with animations and better styling.

## License
This project is open-source and available under the [MIT License](LICENSE).

## Acknowledgments
- Pokémon TCG API for providing the card data.
- Flutter and Dart communities for resources and support.

For any issues or suggestions, feel free to create a GitHub issue or contribute to the project!

