import 'dart:isolate';

void isolatedTask(SendPort sendPort, { required int count}) async {
  for (int i = 0; i < count; i++) {
    await Future.delayed(Duration(seconds: 1));
    sendPort.send(i);
  }
}

void main() {
  final receivePort = ReceivePort();
  Isolate.spawn((port) => isolatedTask(port,count: 10), receivePort.sendPort);

  receivePort.listen((data) {
    print('Data from stream $data');
    if(data == 9) receivePort.close();
  });
}
