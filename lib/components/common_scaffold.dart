import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uchugo_collection/pages/history_page.dart';

class CommonScaffold extends StatelessWidget {
  final Widget body;

  const CommonScaffold({super.key, required this.body});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset('assets/images/logo.svg'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HistoryPage()),
              );
            },
            icon: SvgPicture.asset('assets/icons/history_icon.svg'),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/settings_icon.svg'),
          ),
        ],
      ),
      body: body,
    );
  }
}
