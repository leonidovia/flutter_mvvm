class EventArgs {
  static final EventArgs empty = EventArgs();
}

typedef EventHandler<EventArgs> = void Function(Object sender, EventArgs e);

class Event<T extends EventArgs> {
  final _handlers = <EventHandler<T>>[];

  Object? _lastEventSender;
  T? _lastEventArgs;

  void subscribe(EventHandler<T> handler, {bool canHandleLastEvent = false}) {
    _handlers.add(handler);

    if (canHandleLastEvent &&
        _lastEventSender != null &&
        _lastEventArgs != null) {
      handler.call(_lastEventSender!, _lastEventArgs!);
    }
  }

  void unsubscribe(EventHandler<T> handler) => _handlers.remove(handler);

  void raise(Object sender, T e) {
    _lastEventSender = sender;
    _lastEventArgs = e;

    for (final h in _handlers) {
      h.call(sender, e);
    }
  }

  void dispose() {
    _lastEventSender = null;
    _lastEventArgs = null;
    _handlers.clear();
  }
}

class ViewModelEvent<T extends EventArgs> {
  EventHandler<T>? _handler;

  void subscribe(EventHandler<T> handler) => _handler = handler;

  void raise(Object sender, T e) => _handler?.call(sender, e);

  void dispose() => _handler = null;
}
