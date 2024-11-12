// import 'package:flutter/material.dart';
// import 'package:home_project/view/main_page/main_page.dart';

// class DreamScreen extends StatefulWidget {
//   const DreamScreen({super.key});

//   @override
//   State<DreamScreen> createState() => _DreamScreenState();
// }

// class _DreamScreenState extends State<DreamScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffe8e6df),
//       appBar: AppBar(
//         backgroundColor: Colors.pink,
//         title: Center(
//           child: Text(
//             "List Of Dreams",
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//         ),
//         leading: IconButton(
//           onPressed: () {
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => MainPage(),
//                 ));
//           },
//           icon: Icon(
//             Icons.arrow_back,
//             size: 28,
//             color: Colors.white,
//           ),
//         ),
//         actions: [
//           IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.more_vert_outlined,
//                 color: Colors.white,
//               ))
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class Dream {
  final String name;
  final int age;
  final dynamic imageUrl;
  final String dreamName;
  final double progress;
  final double earned;
  final double goal;

  Dream(
      {required this.name,
      required this.age,
      required this.dreamName,
      required this.progress,
      required this.earned,
      required this.goal,
      required this.imageUrl});
}

class DreamScreen extends StatelessWidget {
  final List<Dream> dreams = [
    Dream(
      name: "John Doe",
      age: 8,
      dreamName: "Bicycle",
      progress: 0.4,
      earned: 2000,
      goal: 5000,
      imageUrl:
          "https://www.example.com/child_bike.jpg", // Replace with real image URL
    ),
    Dream(
      name: "Emma White",
      age: 7,
      dreamName: "Dollhouse",
      progress: 0.3,
      earned: 2000,
      goal: 5000,

      imageUrl:
          "https://www.example.com/child_dollhouse.jpg", // Replace with real image URL
    ),
    Dream(
      name: "Liam Brown",
      age: 10,
      dreamName: "Toy Train",
      progress: 0.8,
      earned: 2000,
      goal: 5000,
      imageUrl:
          "https://www.example.com/child_toytrain.jpg", // Replace with real image URL
    ),
    Dream(
      name: "Sophia Green",
      age: 9,
      dreamName: "Puzzle Set",
      progress: 0.3,
      earned: 2000,
      goal: 5000,
      imageUrl:
          "https://www.example.com/child_puzzle.jpg", // Replace with real image URL
    ),
    Dream(
      name: "Mason Black",
      age: 6,
      dreamName: "Football",
      progress: 0.7,
      earned: 2000,
      goal: 5000,
      imageUrl:
          "https://www.example.com/child_football.jpg", // Replace with real image URL
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Text(
          'List of Dreams',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(8.0),
        itemCount: dreams.length,
        separatorBuilder: (context, index) => SizedBox(height: 12),
        itemBuilder: (context, index) {
          final dream = dreams[index];
          return DreamItem(dream: dream);
        },
      ),
    );
  }
}

class DreamItem extends StatelessWidget {
  final Dream dream;

  DreamItem({required this.dream});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey[200],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Circle Avatar on the right
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                dream.imageUrl), // Replace with actual URL or Asset
          ),

          // Info in the middle
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dream.name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    'Age: ${dream.age}',
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 8),
                  Text(
                    dream.dreamName,
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                  SizedBox(height: 8),
                  // Linear Progress Indicator
                  LinearProgressIndicator(
                    value: dream.progress,
                    backgroundColor: Colors.grey[300],
                    color: Colors.blue,
                  ),
                  SizedBox(height: 8),
                  // Earned and Goal Information
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Earned: \$${dream.earned.toStringAsFixed(2)}'),
                      Text('Goal: \$${dream.goal.toStringAsFixed(2)}'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
