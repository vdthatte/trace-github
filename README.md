# iMessage-style Confetti Animation App

This iOS app, built using SwiftUI, primarily displays an iMessage-style confetti animation when a floating action button with a plus icon is pressed. The app was developed using [Trace AI](https://trace.zip), and you can demo this particular project [here](https://trace.zip/c/bdb7deab-9c7b-4ac7-8783-4e9618c60f72).

![App Preview](https://login.trace.zip/storage/v1/object/public/trace/bdb7deab-9c7b-4ac7-8783-4e9618c60f72)

## How to Build

1. Clone the repository containing the project.
2. Open the Xcode project file.
3. Build and run the app on a simulator or a physical device.

## App Structure

The app consists of three main components:

1. `ContentView`: The main view that displays the confetti animation and the floating action button.
2. `ConfettiView`: A separate view that creates the confetti animation.
3. `ConfettiPiece`: A separate view that creates a single confetti piece.

### ContentView

The `ContentView` is responsible for displaying the confetti animation and the floating action button. It has a state property `showConfetti` that controls the confetti animation. When the floating action button is pressed, the `showConfetti` state is toggled, triggering the confetti animation.

### ConfettiView

The `ConfettiView` is responsible for creating the confetti animation. It generates multiple confetti pieces with random colors, sizes, and positions using a `ForEach` loop. The confetti pieces are created using the `ConfettiPiece` view.

### ConfettiPiece

The `ConfettiPiece` view is responsible for creating a single confetti piece. It is a custom shape that creates a diamond-like confetti piece using the `path` function.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.