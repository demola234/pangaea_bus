import 'package:pangaea_bus/src/core/event/envelope.dart';
import 'package:pangaea_bus/src/core/event/pangaea_event.dart';
import 'package:pangaea_bus/src/topic/topic_channel.dart';

class EventDispatcher {
  void dispatch(TopicChannel channel, EventEnvelope<PangaeaEvent> envelope) {
    channel.publish(envelope);
  }
}