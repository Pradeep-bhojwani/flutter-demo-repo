import 'package:flutter/material.dart';

class drop_down extends StatefulWidget {
  const drop_down({super.key});

  @override
  State<drop_down> createState() => _drop_downState();
}

class _drop_downState extends State<drop_down> {
  final List<String> courses = ['Commerce', 'Science', 'Arts', 'Engineering'];
  Map<int, bool> openCourses =
      {}; // Track which courses are open with index and state
  double containerHeight = 200; // Base height for each CustomCell

  // Closure to update height and log opened arrays
  void updateHeight(bool isOpen, int index) {
    setState(() {
      openCourses[index] = isOpen; // Track open/close state for each course
      if (isOpen) {
        containerHeight += 200; // Increase height
      } else {
        containerHeight -= 200; // Decrease height
      }
      _logOpenCourses(); // Log opened courses and indexes
    });
  }

  // Function to log which courses are open
  void _logOpenCourses() {
    openCourses.forEach((index, isOpen) {
      if (isOpen) {
        print('Course at index $index (${courses[index]}) is opened.');
      } else {
        print('Course at index $index (${courses[index]}) is closed.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drop Down'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: courses.length,
          itemBuilder: (context, index) {
            bool isOpen =
                openCourses[index] ?? false; // Default to false if not tracked
            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isOpen = !isOpen;
                      openCourses[index] = isOpen; // Toggle open/close state
                      _logOpenCourses(); // Log opened arrays
                    });
                  },
                  child: Container(
                    color: Colors.grey[300],
                    height: 40,
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              courses[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          Icon(
                            isOpen
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (isOpen) ...[
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: containerHeight, // Dynamically adjust height
                    child: CustomCell(
                      onToggle: (isOpen) => updateHeight(isOpen, index),
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}

class CustomCell extends StatefulWidget {
  final Function(bool) onToggle; // Pass a closure to notify height change

  const CustomCell({required this.onToggle});

  @override
  _CustomCellState createState() => _CustomCellState();
}

class _CustomCellState extends State<CustomCell> {
  final List<String> subjects = ['Maths', 'English', 'Physics', 'Biology'];
  Set<int> openCourses = {}; // Track which subjects are opened
  final double closedHeight = 30.0; // Height when closed
  final double openHeight = 200.0; // Height when open

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        bool isOpen = openCourses.contains(index);
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (openCourses.contains(index)) {
                    openCourses.remove(index);
                    widget.onToggle(false); // Notify parent to reduce height
                  }else{
                    openCourses.add(index);
                    widget.onToggle(true); // Notify parent to increase height
                  }
                });
              },
              child: Container(
                color: Colors.grey[100],
                height: closedHeight,
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          subjects[index],
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                      ),
                      Icon(
                        isOpen ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: isOpen ? openHeight : 0, // Adjust height based on state
              child: isOpen ? _CustomMarks() : null,
            ),
          ],
        );
      },
    );
  }
}

class _CustomMarks extends StatelessWidget {
  final List<String> marks = ['Marks 50', 'Marks 10', 'Marks 100', 'Marks 80'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: marks.length,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.grey[50],
          height: 30,
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    marks[index],
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
