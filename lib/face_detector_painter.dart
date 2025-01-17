import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

import 'coordinates_translator.dart';

class FaceDetectorPainter extends CustomPainter {
  FaceDetectorPainter(this.faces, this.absoluteImageSize, this.rotation);

  final List<Face> faces;
  final Size absoluteImageSize;
  final InputImageRotation rotation;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.1
      ..color = Color.fromARGB(255, 236, 177, 88);

    for (final Face face in faces) {
      final double padding = 30;
      canvas.drawRRect(
        RRect.fromLTRBAndCorners(
          translateX(face.boundingBox.left - padding, rotation, size,
              absoluteImageSize),
          translateY(face.boundingBox.top - padding, rotation, size,
              absoluteImageSize),
          translateX(face.boundingBox.right + padding, rotation, size,
              absoluteImageSize),
          translateY(face.boundingBox.bottom + padding, rotation, size,
              absoluteImageSize),
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        paint,
      );

      void paintContour(FaceContourType type) {
        final faceContour = face.contours[type];
        if (faceContour?.points != null) {
          Path path = Path();
          for (int i = 0; i < faceContour!.points.length; i++) {
            final point = faceContour.points[i];
            final startPoint = Offset(
              translateX(point.x.toDouble(), rotation, size, absoluteImageSize),
              translateY(point.y.toDouble(), rotation, size, absoluteImageSize),
            );
            if (i == 0) {
              path.moveTo(startPoint.dx, startPoint.dy);
            } else {
              path.lineTo(startPoint.dx, startPoint.dy);
            }
          }
          path.close();
          canvas.drawPath(path, paint);
        }
      }

      /* void paintContour(FaceContourType type) {
        final faceContour = face.contours[type];
        if (faceContour?.points != null) {
          for (final Point point in faceContour!.points) {
            canvas.drawCircle(
                Offset(
                  translateX(
                      point.x.toDouble(), rotation, size, absoluteImageSize),
                  translateY(
                      point.y.toDouble(), rotation, size, absoluteImageSize),
                ),
                1,
                paint);
          }
        }
      }
*/
      paintContour(FaceContourType.face);
      paintContour(FaceContourType.leftEyebrowTop);
      //paintContour(FaceContourType.leftEyebrowBottom);
      paintContour(FaceContourType.rightEyebrowTop);
      //paintContour(FaceContourType.rightEyebrowBottom);
      paintContour(FaceContourType.leftEye);
      paintContour(FaceContourType.rightEye);
      paintContour(FaceContourType.upperLipTop);
      paintContour(FaceContourType.upperLipBottom);
      paintContour(FaceContourType.lowerLipTop);
      paintContour(FaceContourType.lowerLipBottom);
      paintContour(FaceContourType.noseBridge);
      paintContour(FaceContourType.noseBottom);
      paintContour(FaceContourType.leftCheek);
      paintContour(FaceContourType.rightCheek);
    }
  }

  @override
  bool shouldRepaint(FaceDetectorPainter oldDelegate) {
    return oldDelegate.absoluteImageSize != absoluteImageSize ||
        oldDelegate.faces != faces;
  }
}
