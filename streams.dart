Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    await Future.delayed(Duration(seconds: 1));
    yield i;
  }
}

void main() {
  final stream = countStream(10);
  stream.listen((data) {
    print('Data from stream $data');
  });
}