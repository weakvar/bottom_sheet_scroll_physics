import 'package:bottom_sheet_scroll_physics/bottom_sheet_scroll_physics.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example App',
      theme: ThemeData(primarySwatch: Colors.indigo),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: () {
                  showMaterialModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const BottomSheetWithCustomPhysics();
                    },
                  );
                },
                child: const Text('Bottom Sheet w/ BottomSheetScrollPhysics'),
              ),
              TextButton(
                onPressed: () {
                  showMaterialModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const DefaultBottomSheet();
                    },
                  );
                },
                child: const Text('Default Bottom Sheet'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomSheetWithCustomPhysics extends StatelessWidget {
  const BottomSheetWithCustomPhysics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: deviceHeight - statusBarHeight),
      child: SafeArea(
        top: false,
        child: ListView.builder(
          physics: const BottomSheetScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 25,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Inner Item at $index'),
            );
          },
        ),
      ),
    );
  }
}

class DefaultBottomSheet extends StatelessWidget {
  const DefaultBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: deviceHeight - statusBarHeight),
      child: SafeArea(
        top: false,
        child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 25,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Inner Item at $index'),
            );
          },
        ),
      ),
    );
  }
}
