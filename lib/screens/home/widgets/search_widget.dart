import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final FocusNode focusNode;
  const SearchWidget({
    Key? key,
    required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 327,
      child: TextField(
        autofocus: true,
        focusNode: focusNode,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          labelText: 'Pesquisar',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
