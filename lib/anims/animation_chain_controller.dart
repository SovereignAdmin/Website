import 'dart:collection';
import 'package:flutter/animation.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

/// Snapshot of the currently playing animation
class ActiveChainAnimation {
  final String id;
  final SequenceAnimation sequence;

  ActiveChainAnimation(this.id, this.sequence);

  T? value<T>(String tag) {
    try {
      return sequence[tag].value as T;
    } catch (_) {
      return null;
    }
  }
}

/// Internal queue entry
class _ChainEntry {
  final String id;
  final Set<String> tags;
  final SequenceAnimation Function(AnimationController controller) builder;

  _ChainEntry(this.id, this.tags, this.builder);
}

/// Queue-based controller for chaining SequenceAnimations safely
class AnimationChainController {
  final AnimationController _controller;
  final Queue<_ChainEntry> _queue = Queue();

  ActiveChainAnimation? _active;
  Set<String> _activeTags = {};

  final Map<String, dynamic> _committedValues = {};

  bool _isPlaying = false;
  bool _disposed = false;

  AnimationChainController({required TickerProvider vsync})
    : _controller = AnimationController(vsync: vsync) {
    _controller.addStatusListener(_handleStatus);
  }

  // ─────────────────────────────────────────────────────────────
  // Public API
  // ─────────────────────────────────────────────────────────────

  AnimationController get controller => _controller;

  /// Currently active animation ID (null if idle)
  String? get activeId => _active?.id;

  /// Is the controller idle?
  bool get isIdle => !_isPlaying && _queue.isEmpty;

  /// Is a specific animation ID currently playing?
  bool isPlaying(String id) => _active?.id == id;

  /// Enqueue an animation with explicit tag declaration
  void enqueue(
    String id, {
    required Set<String> tags,
    required SequenceAnimation Function(AnimationController controller) builder,
  }) {
    if (_disposed) return;
    _queue.add(_ChainEntry(id, tags, builder));

    // Initialize committed values for tags
    for (final tag in tags) {
      if (!_committedValues.containsKey(tag)) {
        _committedValues[tag] = 0.0; // or a default value that makes sense
      }
    }

    if (!_isPlaying) {
      _playNext();
    }
  }

  /// Clear all animations immediately
  void clear() {
    _queue.clear();
    _controller.stop();
    _active = null;
    _activeTags.clear();
    _isPlaying = false;
  }

  /// Read a value ONLY if the requested animation ID is active.
  /// Otherwise falls back to committed or default values.
  T valueFor<T>(String id, String tag, {required T defaultValue}) {
    try {
      // 1️⃣ Active animation + matching ID
      if (_active?.id == id) {
        final v = _active!.value<T>(tag);
        if (v != null) return v;
      }

      // 2️⃣ Last committed value
      if (_committedValues.containsKey(tag)) {
        return _committedValues[tag] as T;
      }

      // 3️⃣ Safe fallback
      return defaultValue;
    } catch (_) {
      return defaultValue;
    }
  }

  /// Dispose safely
  void dispose() {
    if (_disposed) return;
    _disposed = true;
    _queue.clear();
    _controller.dispose();
  }

  // ─────────────────────────────────────────────────────────────
  // Internal Logic
  // ─────────────────────────────────────────────────────────────

  void _handleStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _commitFinalValues();
      _playNext();
    }
  }

  void _playNext() {
    if (_disposed) return;

    if (_queue.isEmpty) {
      _isPlaying = false;
      _active = null;
      _activeTags.clear();
      return;
    }

    _isPlaying = true;

    final entry = _queue.removeFirst();

    _controller.stop();
    _controller.reset();

    final sequence = entry.builder(_controller);

    if (_controller.duration == null) {
      throw StateError(
        'AnimationChainController: controller.duration must be set '
        'inside the SequenceAnimation builder.',
      );
    }

    _active = ActiveChainAnimation(entry.id, sequence);
    _activeTags = entry.tags;

    _controller.forward();
  }

  void _commitFinalValues() {
    if (_active == null) return;

    for (final tag in _activeTags) {
      try {
        _committedValues[tag] = _active!.sequence[tag].value;
      } catch (_) {
        // ignore safely
      }
    }
  }
}

///////////////////
// Example Usage //
///////////////////

/*
class UiAnimations {
  static SequenceAnimation fadeIn(AnimationController controller) {
    controller.duration = const Duration(milliseconds: 300);
    return SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween(begin: 0.0, end: 1.0),
          from: Duration.zero,
          to: const Duration(milliseconds: 300),
          tag: 'opacity',
        )
        .animate(controller);
  }

  static SequenceAnimation slideUp(AnimationController controller) {
    controller.duration = const Duration(milliseconds: 400);
    return SequenceAnimationBuilder()
        .addAnimatable(
          animatable: Tween(begin: 30.0, end: 0.0),
          from: Duration.zero,
          to: const Duration(milliseconds: 400),
          tag: 'y',
        )
        .animate(controller);
  }
}

chain.enqueue(
  'intro.fade',
  tags: {'opacity'},
  builder: UiAnimations.fadeIn,
);

chain.enqueue(
  'intro.slide',
  tags: {'y'},
  builder: UiAnimations.slideUp,
);

AnimatedBuilder(
  animation: chain.controller,
  builder: (_, __) {
    final opacity = chain.valueFor<double>(
      'intro.fade',
      'opacity',
      defaultValue: 1.0,
    );

    final y = chain.valueFor<double>(
      'intro.slide',
      'y',
      defaultValue: 0.0,
    );

    return Opacity(
      opacity: opacity,
      child: Transform.translate(
        offset: Offset(0, y),
        child: child,
      ),
    );
  },
);

*/
