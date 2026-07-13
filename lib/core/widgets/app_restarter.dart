import 'package:flutter/material.dart';

class AppRestarter extends StatefulWidget {
  const AppRestarter({super.key, required this.child});

  final Widget child;

  static void restart(BuildContext context) {
    final state = context.findAncestorStateOfType<_AppRestarterState>();

    state?.restart();
  }

  @override
  State<AppRestarter> createState() => _AppRestarterState();
}

class _AppRestarterState extends State<AppRestarter> {
  Key _key = UniqueKey();

  void restart() {
    setState(() {
      _key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(key: _key, child: widget.child);
  }
}
