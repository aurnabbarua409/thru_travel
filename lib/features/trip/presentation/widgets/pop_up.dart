import 'package:flutter/material.dart';
import 'package:new_untitled/utils/constants/app_colors.dart';

class PopupController {
  static final PopupController _instance = PopupController._internal();

  factory PopupController() => _instance;

  PopupController._internal();

  OverlayEntry? _entry;

  void show(
    BuildContext context,
    Offset position,
    List<String> list,
    Function(String)? onTap,
  ) {
    if (_entry != null) return; // already open
    final overlay = Overlay.of(context, rootOverlay: true);
    _entry = OverlayEntry(
      builder:
          (context) => Positioned(
            left: position.dx,
            bottom: position.dy,
            child: _PopupMenu(onClose: hide, list: list, onTap: onTap),
          ),
    );

    Overlay.of(context).insert(_entry!);
  }

  void showAdd(
    BuildContext context, {
    double? top,
    double? right,
    double? left,
    double? bottom,
    required List<String> list,
    Function(String)? onTap,
  }) {
    if (_entry != null) return; // already open

    final overlay = Overlay.of(context, rootOverlay: true);

    _entry = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: top,
          right: right,
          left: left,
          bottom: bottom,
          child: _PopupMenu(onClose: hide, list: list, onTap: onTap),
        );
      },
    );

    overlay.insert(_entry!);
  }

  /* <<<<<<<<<<<<<<  ✨ Windsurf Command ⭐ >>>>>>>>>>>>>>>> */

  /// Removes the current overlay entry from the overlay.
  /// If no overlay entry exists, this is a no-op.
  ///
  /// This function is typically called when the user is done
  /// interacting with the popup menu.
  /* <<<<<<<<<<  7f01f1c8-8b39-47e0-b564-66b60f1f5b4e  >>>>>>>>>>> */
  void hide() {
    _entry?.remove();
    _entry = null;
  }

  bool get isVisible => _entry != null;
}

class _PopupMenu extends StatelessWidget {
  final VoidCallback onClose;
  final Function(String)? onTap;
  final List<String> list;

  const _PopupMenu({required this.onClose, required this.list, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 220,
        decoration: BoxDecoration(
          color: const Color(0xFF1B2C1F),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.black, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: const Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: list.length,
            padding: EdgeInsets.zero,
            separatorBuilder:
                (_, __) => Divider(color: AppColors.black, height: 1),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  onTap?.call(list[index]);
                  // Get.toNamed(AppRoutes.plans);
                  onClose();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Text(
                    list[index].toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
