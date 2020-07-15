import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebDetailPage extends StatefulWidget {

  String url;

  WebDetailPage({this.url});

  @override
  State<StatefulWidget> createState() {
    return _WebDetailPage();
  }

}

class _WebDetailPage extends State<WebDetailPage> {

  WebViewController _controller;
  ValueNotifier canGoBack = ValueNotifier(false);
  ValueNotifier canGoForward = ValueNotifier(false);
  String title = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: WebView(
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        navigationDelegate: (request) {
          if(!request.url.startsWith('http')) {
            return NavigationDecision.prevent;
          } else {
            return NavigationDecision.navigate;
          }
        },
        onWebViewCreated: (controller) {
          _controller = controller;
        },
        onPageFinished: (url) {
          refreshNavigator();
          _controller.evaluateJavascript("document.title").then((value) {
            setState(() {
              title = value;
            });
          });
        },
      ),
    );
  }

  void refreshNavigator() {
    _controller.canGoBack().then((value) => canGoBack.value = value);

    _controller.canGoForward().then((value) => canGoForward.value = value);
  }

}