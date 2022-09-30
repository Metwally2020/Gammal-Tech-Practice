import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class MyWebView extends StatefulWidget {
  final String title;
  final String website;

  const MyWebView({super.key, required this.title, required this.website});

  @override
  State<MyWebView> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          backgroundColor: Colors.teal,
        ),
      
        body: SafeArea(
          child: WebView(
            initialUrl: widget.website,
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ));
  }
}
