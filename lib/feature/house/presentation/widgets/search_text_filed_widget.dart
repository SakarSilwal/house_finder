import 'package:flutter/material.dart';

class SearchTextFiledWidget extends StatelessWidget {
  const SearchTextFiledWidget({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: searchController,
        onChanged: (value) {
          print("Searching for: $value");
        },
        decoration: InputDecoration(
          hintText: "Search...",
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          suffixIcon: searchController.text.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.clear, color: Colors.grey),
                  onPressed: () {
                    searchController.clear();
                  },
                )
              : null,
          filled: true,
          fillColor: Colors.grey.shade200,
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
