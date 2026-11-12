
import 'package:flutter/material.dart';

void main() {
  runApp(const GradesApp());
}

class GradesApp extends StatelessWidget {
  const GradesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const GradesScreen(),
    );
  }
}

class Student {
  final String name;
  int grade;

  Student(this.name, this.grade);
}

class GradesScreen extends StatefulWidget {
  const GradesScreen({super.key});

  @override
  State<GradesScreen> createState() => _GradesScreenState();
}

class _GradesScreenState extends State<GradesScreen> {
  final List<Student> students = [
    Student('נויה', 92),
    Student('דנה', 71),
    Student('יוסף', 54),
    Student('עומר', 48),
  ];

  double get average {
    int total = 0;
    for (final student in students) {
      total += student.grade;
    }
    return total / students.length;
  }

  void changeGrade(int index, int amount) {
    setState(() {
      students[index].grade =
          (students[index].grade + amount).clamp(0, 100).toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFFFF8FF),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ממוצע: ${average.toStringAsFixed(1)}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: ListView.builder(
                    itemCount: students.length,
                    itemBuilder: (context, index) {
                      final student = students[index];
                      final passed = student.grade >= 60;

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          children: [
                            Icon(
                              passed
                                  ? Icons.check_circle
                                  : Icons.cancel,
                              color: passed
                                  ? Colors.green
                                  : Colors.red,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  student.name,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Text(
                                  'ציון: ${student.grade}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () => changeGrade(index, -1),
                              icon: const Icon(Icons.remove),
                            ),
                            IconButton(
                              onPressed: () => changeGrade(index, 1),
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
