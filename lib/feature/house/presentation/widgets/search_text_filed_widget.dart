import 'package:flutter/material.dart';
import 'package:house_finder/feature/house/data/models/house_model.dart';

// class SearchTextFiledWidget extends StatelessWidget {
//   const SearchTextFiledWidget({super.key});
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController searchController = TextEditingController();

//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: TextField(
//         controller: searchController,
//         onChanged: (value) {
//           print("Searching for: $value");
//         },
//         decoration: InputDecoration(
//           hintText: "Search...",
//           prefixIcon: Icon(Icons.search, color: Colors.grey),
//           suffixIcon: searchController.text.isNotEmpty
//               ? IconButton(
//                   icon: Icon(Icons.clear, color: Colors.grey),
//                   onPressed: () {
//                     searchController.clear();
//                   },
//                 )
//               : null,
//           filled: true,
//           fillColor: Colors.grey.shade200,
//           contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//             borderSide: BorderSide.none,
//           ),
//         ),
//       ),
//     );
//   }
// }
class SearchTextFiledWidget extends StatelessWidget {
  final List<HouseModel> houses;
  const SearchTextFiledWidget({super.key, required this.houses});

  @override
  Widget build(BuildContext context) {
    // Suppose you already have the list of items from BLoC

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Autocomplete<String>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text.isEmpty) {
            return const Iterable<String>.empty();
          }
          return houses
              .where(
                (house) => house.name.toLowerCase().contains(
                  textEditingValue.text.toLowerCase(),
                ),
              )
              .map((house) => house.name);
        },
        onSelected: (String selected) {
          print("Selected: $selected");
        },
        fieldViewBuilder: (context, controller, focusNode, onFieldSubmitted) {
          return TextField(
            controller: controller,
            focusNode: focusNode,
            decoration: InputDecoration(
              hintText: "Search...",
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              suffixIcon: controller.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, color: Colors.grey),
                      onPressed: () {
                        controller.clear();
                      },
                    )
                  : null,
              filled: true,
              fillColor: Colors.grey.shade200,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
          );
        },
        optionsViewBuilder:
            (context, AutocompleteOnSelected<String> onSelected, options) {
              return Align(
                alignment: Alignment.topLeft,
                child: Material(
                  elevation: 4.0,
                  borderRadius: BorderRadius.circular(8),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 200),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: options.length,
                      itemBuilder: (BuildContext context, int index) {
                        final String option = options.elementAt(index);
                        return ListTile(
                          title: Text(option),
                          onTap: () {
                            onSelected(option);
                          },
                        );
                      },
                    ),
                  ),
                ),
              );
            },
      ),
    );
  }
}
