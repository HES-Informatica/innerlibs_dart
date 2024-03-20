import 'package:flutter/material.dart';
import 'package:innerlibs/innerlibs.dart';

class IconCard extends StatelessWidget {
  const IconCard(
      {Key? key,
      required this.title,
      required this.icon,
      this.accentColor,
      this.description,
      this.onTap,
      this.elevation,
      this.onTapDown,
      this.onTapUp,
      this.onTapCancel,
      this.onDoubleTap,
      this.onLongPress,
      this.onSecondaryTap,
      this.onSecondaryTapDown,
      this.onSecondaryTapUp,
      this.onSecondaryTapCancel,
      this.onHighlightChanged,
      this.onHover,
      this.mouseCursor,
      this.enableFeedback = true,
      this.onFocusChange,
      this.autofocus = false,
      this.focusNode,
      this.canRequestFocus = true,
      this.statesController,
      this.hoverDuration})
      : super(key: key);

  final String title;
  final IconData icon;
  final Color? accentColor;
  final String? description;
  final double? elevation;

  /// Called when the user taps this part of the material.
  final GestureTapCallback? onTap;

  /// Called when the user taps down this part of the material.
  final GestureTapDownCallback? onTapDown;

  /// Called when the user releases a tap that was started on this part of the
  /// material. [onTap] is called immediately after.
  final GestureTapUpCallback? onTapUp;

  /// Called when the user cancels a tap that was started on this part of the
  /// material.
  final GestureTapCallback? onTapCancel;

  /// Called when the user double taps this part of the material.
  final GestureTapCallback? onDoubleTap;

  /// Called when the user long-presses on this part of the material.
  final GestureLongPressCallback? onLongPress;

  /// Called when the user taps this part of the material with a secondary button.
  final GestureTapCallback? onSecondaryTap;

  /// Called when the user taps down on this part of the material with a
  /// secondary button.
  final GestureTapDownCallback? onSecondaryTapDown;

  /// Called when the user releases a secondary button tap that was started on
  /// this part of the material. [onSecondaryTap] is called immediately after.
  final GestureTapUpCallback? onSecondaryTapUp;

  /// Called when the user cancels a secondary button tap that was started on
  /// this part of the material.
  final GestureTapCallback? onSecondaryTapCancel;

  /// Called when this part of the material either becomes highlighted or stops
  /// being highlighted.
  ///
  /// The value passed to the callback is true if this part of the material has
  /// become highlighted and false if this part of the material has stopped
  /// being highlighted.
  ///
  /// If all of [onTap], [onDoubleTap], and [onLongPress] become null while a
  /// gesture is ongoing, then [onTapCancel] will be fired and
  /// [onHighlightChanged] will be fired with the value false _during the
  /// build_. This means, for instance, that in that scenario [State.setState]
  /// cannot be called.
  final ValueChanged<bool>? onHighlightChanged;

  /// Called when a pointer enters or exits the ink response area.
  ///
  /// The value passed to the callback is true if a pointer has entered this
  /// part of the material and false if a pointer has exited this part of the
  /// material.
  final ValueChanged<bool>? onHover;

  /// The cursor for a mouse pointer when it enters or is hovering over the
  /// widget.
  ///
  /// If [mouseCursor] is a [MaterialStateProperty<MouseCursor>],
  /// [MaterialStateProperty.resolve] is used for the following [MaterialState]s:
  ///
  ///  * [MaterialState.hovered].
  ///  * [MaterialState.focused].
  ///  * [MaterialState.disabled].
  ///
  /// If this property is null, [MaterialStateMouseCursor.clickable] will be used.
  final MouseCursor? mouseCursor;

  /// Whether detected gestures should provide acoustic and/or haptic feedback.
  ///
  /// For example, on Android a tap will produce a clicking sound and a
  /// long-press will produce a short vibration, when feedback is enabled.
  ///
  /// See also:
  ///
  ///  * [Feedback] for providing platform-specific feedback to certain actions.
  final bool enableFeedback;

  /// {@template flutter.material.inkwell.onFocusChange}
  /// Handler called when the focus changes.
  ///
  /// Called with true if this widget's node gains focus, and false if it loses
  /// focus.
  /// {@endtemplate}
  final ValueChanged<bool>? onFocusChange;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.canRequestFocus}
  final bool canRequestFocus;

  /// {@template flutter.material.inkwell.statesController}
  /// Represents the interactive "state" of this widget in terms of
  /// a set of [MaterialState]s, like [MaterialState.pressed] and
  /// [MaterialState.focused].
  ///
  /// Classes based on this one can provide their own
  /// [MaterialStatesController] to which they've added listeners.
  /// They can also update the controller's [MaterialStatesController.value]
  /// however, this may only be done when it's safe to call
  /// [State.setState], like in an event handler.
  /// {@endtemplate}
  final MaterialStatesController? statesController;

  /// The duration of the animation that animates the hover effect.
  ///
  /// The default is 50ms.
  final Duration? hoverDuration;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: description.ifBlank(title) ?? "",
      child: Card(
        elevation: elevation,
        child: ClipPath(
          clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
          child: LayoutBuilder(builder: (context, cs) {
            return Container(
              width: 250,
              height: 100,
              decoration: accentColor != null ? BoxDecoration(border: Border(right: BorderSide(color: accentColor!, width: 8))) : null,
              child: InkWell(
                splashColor: accentColor,
                autofocus: autofocus,
                canRequestFocus: canRequestFocus,
                focusColor: accentColor?.withOpacity(.7),
                enableFeedback: enableFeedback,
                hoverColor: accentColor?.withOpacity(.7),
                mouseCursor: mouseCursor,
                focusNode: focusNode,
                hoverDuration: hoverDuration,
                highlightColor: accentColor,
                onTap: onTap,
                onDoubleTap: onDoubleTap,
                onLongPress: onLongPress,
                onSecondaryTap: onSecondaryTap,
                onFocusChange: onFocusChange,
                onHighlightChanged: onHighlightChanged,
                onHover: onHover,
                onSecondaryTapCancel: onSecondaryTapCancel,
                onSecondaryTapDown: onSecondaryTapDown,
                onSecondaryTapUp: onSecondaryTapUp,
                onTapCancel: onTapCancel,
                onTapDown: onTapDown,
                onTapUp: onTapUp,
                statesController: statesController,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Icon(
                        icon,
                        size: 50,
                        color: accentColor?.withOpacity(1),
                      ).setOpacity(opacity: .4).positionTop(top: 0),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: SizedBox(
                          width: cs.maxWidth * .6,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                title,
                                maxLines: 2,
                                textAlign: TextAlign.right,
                                style: const TextStyle(fontWeight: FontWeight.w900),
                                overflow: TextOverflow.fade,
                              ),
                              if (description.isNotBlank)
                                Text(
                                  description!,
                                  maxLines: 2,
                                  style: const TextStyle(fontStyle: FontStyle.italic),
                                  textAlign: TextAlign.right,
                                  overflow: TextOverflow.fade,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
