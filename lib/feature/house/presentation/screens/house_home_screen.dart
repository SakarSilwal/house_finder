import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:house_finder/feature/house/presentation/blocs/house_bloc/house_bloc.dart';
import 'package:house_finder/feature/house/presentation/blocs/house_bloc/house_state.dart';
import 'package:house_finder/feature/house/presentation/widgets/house_details_card_widget.dart';
import 'package:house_finder/feature/house/presentation/widgets/search_text_filed_widget.dart';

class HouseHomeScreen extends StatelessWidget {
  const HouseHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        title: Text('houses', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, color: Colors.amber),
          ),
        ],
      ),
      body: BlocBuilder<HouseBloc, HouseState>(
        builder: (context, state) {
          if (state.houseStatus == HouseStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.houseStatus == HouseStatus.success) {
            final houseData = state.houseModel; // <-- list of houses

            return SingleChildScrollView(
              child: Column(
                children: [
                  // ✅ now you can pass it here
                  SearchTextFiledWidget(houses: houseData),

                  const SizedBox(height: 20),

                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          childAspectRatio: 0.75,
                        ),
                    itemCount: houseData.length,
                    itemBuilder: (context, index) {
                      final house = houseData[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HouseDetailsCardWidget(house: house),
                      );
                    },
                  ),
                ],
              ),
            );
          } else if (state.houseStatus == HouseStatus.error) {
            return const Center(
              child: Text('there is some error in fetching...'),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

// class HouseHomeScreen extends StatelessWidget {
//   const HouseHomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black87,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         leading: IconButton(
//           onPressed: () {},
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//         ),
//         backgroundColor: Colors.black,
//         title: Text('houses', style: TextStyle(color: Colors.white)),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(Icons.settings, color: Colors.amber),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SearchTextFiledWidget(houses: ),
//             SizedBox(height: 20),
//             BlocBuilder<HouseBloc, HouseState>(
//               builder: (context, state) {
//                 if (state.houseStatus == HouseStatus.loading) {
//                   return Center(child: CircularProgressIndicator());
//                 } else if (state.houseStatus == HouseStatus.success) {
//                   final houseData = state.houseModel;
//                   return GridView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       mainAxisSpacing: 8,
//                       crossAxisSpacing: 8,
//                       childAspectRatio: 0.75,
//                     ),
//                     itemCount: houseData.length,
//                     itemBuilder: (context, index) {
//                       final house = houseData[index];
//                       return Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: HouseDetailsCardWidget(house: house),
//                       );
//                     },
//                   );
//                 } else if (state.houseStatus == HouseStatus.error) {
//                   return Center(
//                     child: Text('there is some error in fetching...'),
//                   );
//                 } else {
//                   return SizedBox.shrink();
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
