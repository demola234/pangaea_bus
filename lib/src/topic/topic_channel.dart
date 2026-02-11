import 'dart:async';

import 'package:pangaea_bus/src/core/event/envelope.dart';
import 'package:pangaea_bus/src/core/event/pangaea_event.dart';

class TopicChannel {
  final String name;

  final StreamController<EventEnvelope<PangaeaEvent>> _controller = StreamController.broadcast();

  TopicChannel(this.name);


  void publish(EventEnvelope<PangaeaEvent> envelope) {
    _controller.add(envelope);
  }

  Stream<EventEnvelope<PangaeaEvent>> subscribe() {
    return _controller.stream;
  }

  void dispose() {
    _controller.close();
  }
}