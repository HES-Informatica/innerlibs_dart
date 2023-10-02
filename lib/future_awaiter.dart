import 'package:flutter/material.dart';
import 'package:string_extensions/string_extensions.dart';

/// Wraps a [FutureBuilder] and make is easier to use
class FutureAwaiter<T> extends StatelessWidget {
  /// The asynchronous computation to which this builder is currently connected, possibly null.
  /// If no future has yet completed, including in the case where [future] is null, the data provided to the [builder] will be set to [initialData]
  final Future<T> future;

  /// Function thats receive a [T] data returned by [future] and return a [Widget].
  final Widget Function(T data) doneWidget;

  /// A [Widget] to return if [T] is null or empty. If not specified return a [Placeholder]
  ///
  /// Empty [List] and blank [String] will be considered empty data in this case.
  final Widget? doneWithoutDataWidget;

  /// [Widget] to show while [future] is running
  final Widget? loadingWidget;

  /// A function thats receive an error and return a [Widget]. If not specified return a [ErrorWidget]
  final Widget Function(Object error)? errorWidget;

  /// The data that will be used to create the snapshots provided until a non-null [future] has completed.
  /// If the future completes with an error, the data in the [AsyncSnapshot] provided to the [builder] will become null, regardless of [initialData]. (The error itself will be available in [errorWidget] function)
  final T? initialData;

  const FutureAwaiter({
    super.key,
    required this.future,
    required this.doneWidget,
    this.doneWithoutDataWidget,
    this.loadingWidget,
    this.errorWidget,
    this.initialData,
  });

  @override
  Widget build(BuildContext context) => FutureBuilder<T>(
        future: future,
        initialData: initialData,
        builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: loadingWidget ?? const CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return errorWidget != null ? errorWidget!(snapshot.error!) : ErrorWidget(snapshot.error!);
            } else if (snapshot.hasData && snapshot.data != null) {
              switch (snapshot.data) {
                case String():
                  var l = snapshot.data as String;
                  if (l.isBlank) {
                    debugPrint("String is null, blank or empty");
                    return doneWithoutDataWidget ?? const SizedBox.shrink();
                  }
                case List():
                  var l = snapshot.data as List;
                  if (l.isEmpty) {
                    debugPrint("List is empty");
                    return doneWithoutDataWidget ?? const SizedBox.shrink();
                  }
                default:
                  break;
              }
              return doneWidget(snapshot.data as T);
            }
            return doneWithoutDataWidget ?? const SizedBox.shrink();
          }
        },
      );
}
