import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:junkim_velog/constants/sizes.dart';

class LinkTextItem {
  /// 보여질 텍스트
  String text;

  /// 링크 유무
  bool isLink;

  /// 링크 클릭 시 이벤트
  Function()? onTap;

  LinkTextItem({
    required this.text,
    this.isLink = false,
    this.onTap,
  });
}

class LinkText extends StatelessWidget {
  const LinkText({
    super.key,
    required this.items,
  });

  final List<LinkTextItem> items;

  @override
  Widget build(BuildContext context) {
    TextStyle mainTextStyle = const TextStyle(
      color: Colors.black38,
      fontSize: Sizes.size14,
      fontWeight: FontWeight.w500,
    );

    TextStyle linkTextStyle = mainTextStyle.copyWith(
      color: Theme.of(context).primaryColor,
      fontWeight: FontWeight.w600,
    );

    TextSpan getTextSpan(LinkTextItem item) {
      if (item.isLink) {
        return TextSpan(
          text: item.text,
          style: linkTextStyle,
          recognizer: TapGestureRecognizer()..onTap = item.onTap,
        );
      } else {
        return TextSpan(
          text: item.text,
          style: mainTextStyle,
        );
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              for (int i = 0; i < items.length; i++) getTextSpan(items[i]),
            ],
          ),
        ),
      ],
    );
  }
}
