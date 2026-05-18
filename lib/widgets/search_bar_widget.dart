import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {

  final Function(String) onChanged;

  const SearchBarWidget({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    return TextField(
      onChanged: onChanged,

      decoration: InputDecoration(
        hintText: 'Search recipes',

        prefixIcon:
            const Icon(Icons.search),

        filled: true,

        fillColor: Colors.white,

        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(16),

          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}