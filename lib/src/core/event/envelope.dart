import 'pangaea_event.dart';
import 'event_metadata.dart';

class EventEnvelope<T extends PangaeaEvent> {
  final T event;
  final EventMetadata metadata;

  EventEnvelope({
    required this.event,
    required this.metadata,
  });
}