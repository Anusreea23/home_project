import 'package:flutter/material.dart';
import 'package:home_project/view/main_page/main_page.dart';

class CelebrationSchedule extends StatefulWidget {
  const CelebrationSchedule({super.key});

  @override
  State<CelebrationSchedule> createState() => _CelebrationScheduleState();
}

class _CelebrationScheduleState extends State<CelebrationSchedule> {
  TextEditingController celebrationTypeController = TextEditingController();
  TextEditingController celebrationDateController = TextEditingController();
  TextEditingController celebrationTimeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    celebrationTypeController.dispose();
    celebrationDateController.dispose();
    celebrationTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8e6df),
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Center(
          child: Text(
            "Celebration Schedule",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainPage(),
                ));
          },
          icon: Icon(
            Icons.arrow_back,
            size: 28,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert_outlined,
                color: Colors.white,
              ))
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDWoZeM85IBF5i3h2NlxiYJuy1FnupE2rWpQ&s"),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Type Of Celebration',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    TextFormField(
                      controller: celebrationTypeController,
                      decoration: InputDecoration(
                        hintText: 'Enter the type of celebration',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the type of celebration';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),

                    Text(
                      'Celebration Date',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    TextFormField(
                      controller: celebrationDateController,
                      decoration: InputDecoration(
                        hintText: 'Enter the date (e.g. 27/11/2020)',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the celebration date';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),

                    Text(
                      'Celebration Time',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    TextFormField(
                      controller: celebrationTimeController,
                      decoration: InputDecoration(
                        hintText: 'Enter the time (e.g. 12:00 PM - 5:00 PM)',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the celebration time';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 16),

                    // Done Button
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all(Colors.pink),
                              shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      side: BorderSide(color: Colors.pink)))),
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              // Handle the data (e.g., print or save)
                              // print('Type of Celebration: ${celebrationTypeController.text}');
                              // print('Celebration Date: ${celebrationDateController.text}');
                              // print('Celebration Time: ${celebrationTimeController.text}');
                            }
                          },
                          child: Text(
                            'Done',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
