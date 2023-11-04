double boundNumber(double normalNumber, double max, double min) {
  if (normalNumber >= max) {
    return max;
  } else if (normalNumber <= min) {
    return min;
  }
  return normalNumber;
}
