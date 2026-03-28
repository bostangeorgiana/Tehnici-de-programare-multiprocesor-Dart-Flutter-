# Tehnici de programare multiprocesor – Dart & Flutter

This repository explores **multiprocessor (concurrent and parallel) programming techniques** using [Dart](https://dart.dev/) and [Flutter](https://flutter.dev/).

## Overview

Modern applications need to perform multiple tasks simultaneously—fetching data from a network, processing files, updating the UI, and more. Dart and Flutter provide several built-in mechanisms for achieving concurrency and parallelism:

| Mechanism | Description |
|-----------|-------------|
| `Future` & `async/await` | Asynchronous, non-blocking operations |
| `Stream` | Sequences of asynchronous events |
| `Isolate` | True parallelism with separate memory heaps |
| `compute()` | Flutter helper that spawns an `Isolate` for CPU-heavy work |

## Topics Covered

- **Asynchronous programming** – `Future`, `async`, `await`, `then`, `catchError`
- **Streams** – `Stream`, `StreamController`, `StreamBuilder`
- **Isolates** – spawning isolates, `SendPort` / `ReceivePort` communication
- **`compute()` function** – offloading heavy computation in Flutter
- **Event Loop** – understanding Dart's single-threaded event loop and microtask queue
- **Concurrency patterns** – producer/consumer, fan-out, fan-in

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (includes Dart)
- A Dart-compatible IDE (e.g., [VS Code](https://code.visualstudio.com/) with the Dart/Flutter extension, or [Android Studio](https://developer.android.com/studio))

### Run a Dart example

```bash
dart run lib/examples/isolate_example.dart
```

### Run the Flutter app

```bash
flutter pub get
flutter run
```

## Project Structure

```
lib/
├── examples/
│   ├── future_example.dart       # Future & async/await demos
│   ├── stream_example.dart       # Stream demos
│   ├── isolate_example.dart      # Isolate demos
│   └── compute_example.dart      # Flutter compute() demos
└── main.dart                     # Flutter entry point
test/
└── widget_test.dart
```

## Key Concepts

### Futures and async/await

```dart
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Data loaded';
}

void main() async {
  final result = await fetchData();
  print(result); // Data loaded
}
```

### Isolates

```dart
import 'dart:isolate';

void heavyTask(SendPort sendPort) {
  int result = 0;
  for (int i = 0; i < 1000000000; i++) result += i;
  sendPort.send(result);
}

void main() async {
  final receivePort = ReceivePort();
  await Isolate.spawn(heavyTask, receivePort.sendPort);
  final result = await receivePort.first;
  print('Result: $result');
}
```

### compute() in Flutter

```dart
int sumList(List<int> numbers) => numbers.reduce((a, b) => a + b);

final total = await compute(sumList, List.generate(1000000, (i) => i));
```

## Resources

- [Dart concurrency documentation](https://dart.dev/language/concurrency)
- [Flutter – Isolates and compute()](https://docs.flutter.dev/perf/isolates)
- [Dart asynchronous programming codelab](https://dart.dev/codelabs/async-await)

## License

This project is intended for educational purposes.
