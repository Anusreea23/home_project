import 'package:flutter/material.dart';
import 'package:home_project/view/celebration_screen/celebration_schedule.dart';
import 'package:intl/intl.dart';

class CelebrationScreen extends StatefulWidget {
  const CelebrationScreen({super.key});

  @override
  State<CelebrationScreen> createState() => _CelebrationScreenState();
}

class _CelebrationScreenState extends State<CelebrationScreen> {
  TextEditingController datecontroller = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe8e6df),
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Center(
          child: Text(
            "Celebration",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        leading: Icon(
          Icons.home,
          size: 28,
          color: Colors.white,
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
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ListView(
              children: [
                Text(
                  "Would you like to celebrate \n your special day with us?",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  readOnly: true,
                  controller: datecontroller,
                  decoration: InputDecoration(
                      labelText: "Select Date",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15)),
                      suffixIcon: IconButton(
                          onPressed: () async {
                            var selectedDate = await showDatePicker(
                                context: context,
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2025));
                            print(selectedDate.toString());
                            if (selectedDate != null) {
                              datecontroller.text =
                                  DateFormat("dd MMM y").format(selectedDate);
                            }
                          },
                          icon: Icon(Icons.calendar_month))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select a date';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: descriptionController,
                  onChanged: (value) {},
                  maxLines: 6,
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 20, right: 20, bottom: 10, top: 10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      fillColor: Colors.white,
                      filled: true,
                      // focusedBorder: InputBorder.none,
                      // errorBorder: InputBorder.none,
                      // disabledBorder: InputBorder.none,
                      // enabledBorder: InputBorder.none,
                      labelText: "Description",
                      hintStyle: TextStyle(fontSize: 14, color: Colors.black)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 60,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CelebrationSchedule(),
                            ));
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(Colors.pink),
                        shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: Colors.pink)))),
                    child: Text(
                      "Done",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  "They need it! we have it...",
                  style: TextStyle(color: Colors.pink),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
