# BottomSheetScrollPhysics

A custom scroll physics for modal bottom sheets with nested scroll view.

This `BottomSheetScrollPhysics` behaves as `ClampingScrollPhysics` at the top of the scroll and as the default `ScrollPhysics` on the bottom. This means that on iOS it will behave like `ClampingScrollPhysics` at the top and `BouncingScrollPhysics` at the bottom. And on Android, it will behave like `ClampingScrollPhysics` at the top and at the bottom of the scroll.

## Examples

**Default `ScrollPhysics`**

<p align="left">
  <img src="https://github.com/weakvar/bottom_sheet_scroll_physics/blob/feature/readme/example/preview/default.gif" alt="Default ScrollPhysics" width="200">
</p>

**Bottom Sheet with `BottomSheetScrollPhysics`**

<p align="left">
  <img src="https://github.com/weakvar/bottom_sheet_scroll_physics/blob/feature/readme/example/preview/custom_physics.gif" alt="Bottom Sheet with BottomSheetScrollPhysics" width="200">
</p>

## Usage

Use `BottomSheetScrollPhysics` as a physics widget in scrollable widgets.

```dart
@override
Widget build(BuildContext context) {
  return CustomScrollView(
    physics: const BottomSheetScrollPhysics(),
    slivers: [
      // ...
    ],
  );
}
```

## Issues

To report your issues, submit them directly in the [Issues](https://github.com/weakvar/bottom_sheet_scroll_physics/issues) section on GitHub.
