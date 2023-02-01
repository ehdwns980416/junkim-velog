import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:junkim_velog/constants/sizes.dart';

class PracticePageItem extends StatelessWidget {
  final String label;
  final Widget targetScreen;

  const PracticePageItem({
    super.key,
    required this.label,
    required this.targetScreen,
  });

  @override
  Widget build(BuildContext context) {
    void onItemTapped() async {
      await Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => targetScreen,
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.only(left: Sizes.size12),
      child: ListTile(
        title: Text(
          label,
          style: const TextStyle(
            fontSize: Sizes.size16,
            color: Colors.black,
          ),
        ),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: onItemTapped,
      ),
    );
  }
}
