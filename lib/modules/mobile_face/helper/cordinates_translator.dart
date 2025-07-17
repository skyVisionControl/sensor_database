import 'dart:ui';

// enum Camera { front, back }

double translateX(double x, Size canvasSize, Size imageSize) {
  return x * canvasSize.width / imageSize.width;
}

double translateY(
  double y,
  Size canvasSize,
  Size imageSize,
) {
  return y * canvasSize.height / imageSize.height;
}