import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

/// Wraps a [FutureBuilder] into a [Widget] and add some data validations, making it easier to use
class FutureAwaiter<T> extends StatelessWidget {
  /// The asynchronous computation to which this builder is currently connected, possibly null.
  final Future<T> future;

  /// When true, validate the snapshot data against the [IsValid] function
  final bool validate;

  /// Function thats receive a [T] data returned by [future] and return a [Widget].
  final Widget Function(T data) child;

  /// A [Widget] to return if [T] is null or empty. If not specified return a [SizedBox]
  ///
  /// Empty [List] or [Map] and blank [String] will be considered empty data if [validate] is true.
  final Widget? emptyChild;

  /// [Widget] to show while [future] is running
  final Widget? loading;

  /// A function thats receive an error and return a [Widget]. If not specified return a [ErrorWidget]
  final Widget Function(Object error)? errorChild;

  /// Wraps a [FutureBuilder] into a more readable widget
  const FutureAwaiter({
    super.key,
    required this.future,
    required this.child,
    this.emptyChild,
    this.loading,
    this.errorChild,
    this.validate = true,
  });

  @override
  Widget build(BuildContext context) => FutureBuilder<T>(
        future: future,
        builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
          try {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return loading ?? const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasError) {
                throw "${snapshot.error}";
              } else if (!snapshot.hasData || snapshot.data == null || (validate && (snapshot.data).isNotValid)) {
                return emptyChild ?? const SizedBox.shrink();
              } else {
                return child(snapshot.data as T);
              }
            }
          } catch (e) {
            return errorChild != null ? errorChild!(e) : ErrorWidget(e);
          }
        },
      );
}
