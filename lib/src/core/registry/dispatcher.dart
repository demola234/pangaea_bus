import 'dart:async';

class Dispatcher {
  StreamController _controller = StreamController.broadcast();
  void dispatch(event) {
    _controller.add(event);
  }

  Stream get stream => _controller.stream;
}