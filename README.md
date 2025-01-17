# Project: Face Detection in Flutter

## Description

This project is a Flutter application that uses the device's camera and Google ML Kit library for face detection. It includes features such as:

- Real-time face detection through the camera.
- Face detection in images captured or selected from the gallery.
- Identification of facial features such as smile probability, head rotations, and facial landmark positions.

## Technologies Used

- **Flutter**: Main framework for developing the user interface.
- **Camera**: Library to access the device's camera.
- **Google ML Kit Face Detection**: Library for face detection and analysis.
- **Image Picker**: Library for selecting images from the gallery or capturing new ones.

## Installation

1. Clone this repository:
   ```bash
   git clone <REPOSITORY_URL>
   cd <REPOSITORY_NAME>
   ```

2. Ensure Flutter is installed. If not, follow the instructions at [Flutter.dev](https://flutter.dev/docs/get-started/install).

3. Install the project dependencies:
   ```bash
   flutter pub get
   ```

4. Connect a physical device or an emulator.

5. Run the application:
   ```bash
   flutter run
   ```

## Project Structure

```plaintext
/lib
  |- camera_view.dart          # Component to display the camera and process images.
  |- face_detector_view.dart   # Main view for real-time detection.
  |- face_detector_painter.dart # Draws detected features on the canvas.
  |- main.dart                 # Application entry point.
```

## Usage

### Real-Time Detection
1. The application starts in real-time detection mode.
2. By default, it uses the device's front camera.
3. The application processes captured images and overlays the detected faces on the screen.

### Fixed Image Detection (Commented Code)
1. You can enable detection in selected images by uncommenting the `MyHomePage` class in `main.dart`.
2. Capture an image with the camera or select one from the gallery.
3. Detected faces will be listed along with additional information (e.g., bounding box coordinates).

## Key Features

1. **Facial Feature Detection**:
   - Coordinates of the detected face.
   - Positions of facial landmarks (eyes, nose, ears).
   - Smile probability.
   - Head rotation.

2. **Modularity**:
   - Clear separation of responsibilities using dedicated files for each component.

3. **Multiple Camera Compatibility**:
   - Detects and uses all available cameras on the device.

## Future Improvements

- Add support for switching between front and rear cameras.
- Implement a loading indicator during image processing.
- Allow configuration adjustments for face detector sensitivity.
- Export detection results (e.g., save image with bounding boxes).

## Contributions

1. Fork the repository.
2. Create a branch for your feature:
   ```bash
   git checkout -b feature/new-feature
   ```
3. Make your changes and commit them:
   ```bash
   git commit -m "Added new feature"
   ```
4. Submit a pull request explaining your changes.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

---

**Developed with Flutter and Google ML Kit**.

