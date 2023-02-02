import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:junkim_velog/widgets/link_text.dart';

class HyperlinkScreen extends StatelessWidget {
  const HyperlinkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<LinkTextItem> linkTextItems = [
      LinkTextItem(text: 'Don\'t have '),
      LinkTextItem(
        text: 'an',
        isLink: true,
        onTap: () => print('an'),
      ),
      LinkTextItem(text: ' account? '),
      LinkTextItem(
        text: 'Sign Up',
        isLink: true,
        onTap: () => print('Sign Up'),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('하이퍼링크'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Don\'t have an account? Sign Up'),
            RichText(
              text: TextSpan(
                text: 'Don\'t have an account? ',
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Sign Up',
                    style: const TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 15,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // 선택처리
                      },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            LinkText(
              items: linkTextItems,
            ),
          ],
        ),
      ),
    );
  }
}
