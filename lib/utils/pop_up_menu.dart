import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void showPopupMenu(BuildContext context) {
  final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;
  final RenderBox button = context.findRenderObject() as RenderBox;

  final double right =
      overlay.size.width - button.localToGlobal(Offset.zero).dx;
  final double top = 0.0;
  final double bottom =
      overlay.size.height - button.localToGlobal(Offset.zero).dy;

  showMenu<String>(
    context: context,
    position: RelativeRect.fromLTRB(right, top, right, bottom),
    items: [
      PopupMenuItem<String>(
        child: ListTile(
          leading: SvgPicture.asset(
            'assets/select.svg',
          ),
          title: Text(
            'Select',
            style: TextStyle(fontWeight: FontWeight.bold), // Custom weight here
          ),
        ),
      ),
      PopupMenuItem<String>(
        child: ListTile(
          leading: SvgPicture.asset(
            'assets/b.t.2.svg',
          ),
          title: Text(
            'Delete',
            style: TextStyle(fontWeight: FontWeight.bold), // Custom weight here
          ),
        ),
      ),
    ],
  ).then((value) {
    if (value != null) {
      // Handle the selected option
      print('Selected: $value');
    }
  });
}
