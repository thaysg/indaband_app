import 'package:flutter/material.dart';
import 'package:indaband_app/components/body.dart';
import 'package:indaband_app/components/constants.dart';
import 'package:indaband_app/components/text_widget.dart';

import 'search_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FocusNode _focusNode = new FocusNode();
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Hero(
          tag: 'search_screen',
          child: BodyScreen(
            myWidget: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: ListView(
                children: [
                  TextWidget(
                    title: 'Discover',
                    textStyle: textTitle,
                  ),
                  SearchWidget(
                    focusNode: _focusNode,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
