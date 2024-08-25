import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  final AppBar? appBar;
  final Widget? bottomNavigationBar;
  final Widget body;

  const BaseScaffold({super.key, required this.body, this.appBar, this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      bottomNavigationBar: bottomNavigationBar,
      appBar: appBar,
      body: body,
    );
  }
}
