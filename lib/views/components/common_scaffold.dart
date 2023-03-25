import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uchugo_collection/views/pages/history_page.dart';
import 'package:uchugo_collection/views/pages/home_page.dart';

class CommonScaffold extends StatelessWidget {
  final Widget body;

  const CommonScaffold({super.key, required this.body});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          padding: const EdgeInsets.only(top: 56, left: 16, right: 16, bottom: 12),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: SvgPicture.asset('assets/images/logo.svg'),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const HistoryPage()),
                  );
                },
                icon: SvgPicture.asset('assets/icons/history_icon.svg'),
              ),
            ],
          ),
        ),
      ),
      body: body,
    );
  }
}
