import 'topic_channel.dart';

class TopicRegistry {
  final Map<String, TopicChannel> _topics = {};

  TopicChannel getOrCreate(String topicName) {
    return _topics.putIfAbsent(
      topicName,
      () => TopicChannel(topicName),
    );
  }

  void dispose() {
    for (final topic in _topics.values) {
      topic.dispose();
    }
  }
}