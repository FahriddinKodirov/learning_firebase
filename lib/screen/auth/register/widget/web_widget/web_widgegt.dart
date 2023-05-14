import 'package:flutter/material.dart';

class WebWidget extends StatefulWidget {
  final String box;
  const WebWidget({super.key, required this.box});

  @override
  State<WebWidget> createState() => _WebWidgetState();
}

class _WebWidgetState extends State<WebWidget> {
  // late WebViewController webViewController = WebViewController();

  // @override
  // void initState() {
  //   webViewController = WebViewController()
  //     ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //     ..setBackgroundColor(const Color(0x00000000))
  //     ..setNavigationDelegate(NavigationDelegate(
  //         onProgress: (progress) {},
  //         onPageStarted: (url) {},
  //         onPageFinished: (url) {},
  //         onWebResourceError: (error) {},
  //         onNavigationRequest: (NavigationRequest request) {
  //           if (request.url.startsWith('https://www.youtube.com/')) {
  //             return NavigationDecision.prevent;
  //           }
  //           return NavigationDecision.navigate;
  //         }))
  //     ..loadRequest(Uri.parse('https://${widget.box}.com'));

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            // child: WebViewWidget(controller: webViewController)
            ),
      ),
    );
  }
}
