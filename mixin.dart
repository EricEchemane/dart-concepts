mixin LogginMixin {
  void log(String message) {
    print(message);
  }
}

class A with LogginMixin {
  void test() {
    log('test');
  }
}

void main() {
  A a = A();
  a.test();
  a.log('message');
}