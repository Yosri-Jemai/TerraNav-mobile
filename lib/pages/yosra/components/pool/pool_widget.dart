import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'pool_model.dart';
export 'pool_model.dart';

class PoolWidget extends StatefulWidget {
  const PoolWidget({
    super.key,
    this.icon,
    this.background,
    this.borderColor,
  });

  final Widget? icon;
  final Color? background;
  final Color? borderColor;

  @override
  State<PoolWidget> createState() => _PoolWidgetState();
}

class _PoolWidgetState extends State<PoolWidget> {
  late PoolModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PoolModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        width: 44.0,
        height: 44.0,
        decoration: BoxDecoration(
          color: widget.background,
          shape: BoxShape.circle,
          border: Border.all(
            color: widget.borderColor!,
            width: 2.0,
          ),
        ),
        alignment: AlignmentDirectional(0.0, 0.0),
        child: widget.icon!,
      ),
    );
  }
}
