# PangaeaBus

A production-grade, Kafka-style event streaming broker for Flutter micro-apps.

## Features

**Event-Driven Architecture** - Decouple features through topic-based messaging
**Type-Safe Events** - Compile-time guarantees with Dart's type system
**Versioned Events** - Built-in schema evolution and migration
**Persistence** - Offline support with pluggable storage (Hive, SQLite)
**Retry & DLQ** - Automatic retry with dead-letter queue
**Partitioning** - Load balancing for high-throughput scenarios
**Observability** - Built-in logging, metrics, and tracing
**Background Processing** - Isolate support for heavy workloads

## Installation

Add to your `pubspec.yaml`:
```yaml
dependencies:
  pangaea_bus: ^0.1.0
```

## Quick Start
```dart
import 'package:pangaea_bus/pangaea_bus.dart';

// 1. Define your event
class PaymentCompletedEvent extends PangaeaEvent {
  final String paymentId;
  final double amount;
  
  PaymentCompletedEvent({
    required this.paymentId,
    required this.amount,
  });
  
  @override
  String get topic => 'payments.completed';
  
  @override
  String get eventType => 'PaymentCompletedEvent';
  
  // ... other methods like toJson/fromJson for serialization
}

// 2. Initialize the bus
void main() async {
  final bus = await PangaeaBus.initialize(
    config: PangaeaConfig.production(),
  );
  
  // 3. Register event types
  bus.registerEvent<PaymentCompletedEvent>(
    'PaymentCompletedEvent',
    (json) => PaymentCompletedEvent.fromJson(json),
  );
  
  // 4. Subscribe to events
  bus.subscribe<PaymentCompletedEvent>('payments.completed').listen((event) {
    print('Payment completed: ${event.paymentId}');
  });
  
  // 5. Publish events
  await bus.publish(
    PaymentCompletedEvent(
      paymentId: 'pay_123',
      amount: 99.99,
    ),
  );
}
```