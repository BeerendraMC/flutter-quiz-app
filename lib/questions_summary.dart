import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              final isCorrectAnswer =
                  data['user_answer'] == data['correct_answer'];
              return Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isCorrectAnswer
                            ? const Color.fromARGB(255, 140, 249, 143)
                            : const Color.fromARGB(255, 236, 118, 109),
                      ),
                      child: Center(
                        child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data['question'].toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  height: 1.25)),
                          Text(data['user_answer'].toString(),
                              style: TextStyle(
                                height: 1.25,
                                fontWeight: FontWeight.bold,
                                color: isCorrectAnswer
                                    ? const Color.fromARGB(255, 140, 249, 143)
                                    : const Color.fromARGB(255, 236, 118, 109),
                              )),
                          Text(data['correct_answer'].toString(),
                              style: const TextStyle(
                                height: 1.25,
                                color: Color.fromARGB(255, 205, 209, 215),
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
