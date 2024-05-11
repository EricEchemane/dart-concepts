import 'dart:isolate';

void isolatedTask(SendPort sendPort, {required int count}) async {
  for (int i = 0; i < count; i++) {
    await Future.delayed(Duration(seconds: 1));
    if (i == count - 1) {
      sendPort.send(i);
      sendPort.send('done');
    } else
      sendPort.send(i);
  }
}

void main() {
  final receivePort = ReceivePort();
  Isolate.spawn((port) => isolatedTask(port, count: 10), receivePort.sendPort);

  receivePort.listen((data) {
    if (data == 'done')
      receivePort.close();
    else
      print('Data from stream $data');
  });
}
