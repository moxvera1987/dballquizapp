import 'package:flutter/material.dart';
import 'package:dballquizapp/models/quiz_brain.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentQuestionIndex = 0;
  int correctAnswersCount = 0;

  // Lista de colores para los botones de opciones
  final List<Color> buttonColors = [
    Colors.purple,
    Colors.teal,
    Colors.amber,
    Colors.redAccent,
  ];

  void _nextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        _showResultDialog();
      }
    });
  }

  void _checkAnswer(int selectedIndex) {
    if (selectedIndex == questions[currentQuestionIndex].correctOptionIndex) {
      correctAnswersCount++;
    }
    _nextQuestion();
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Resultados'),
        content: Text(
            'Has contestado correctamente $correctAnswersCount de ${questions.length} preguntas.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _resetQuiz();
            },
            child: Text('Reiniciar'),
          ),
        ],
      ),
    );
  }

  void _resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      correctAnswersCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('DragonBall Quiz App'),
      ),
      body: Column(
        children: [
          // Imagen de la pregunta (redondeada)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipOval(
              child: Image.asset(
                question.imageUrl,
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.height * 0.3,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Texto de la pregunta
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              question.questionText,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          // Opciones
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Dos columnas
                childAspectRatio:
                    1, // Proporción de aspecto para botones cuadrados
              ),
              itemCount: question.options.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _checkAnswer(index);
                  },
                  child: Container(
                    margin: EdgeInsets.all(8.0),
                    color: buttonColors[index %
                        buttonColors.length], // Asignar color a cada botón
                    child: Center(
                      child: Text(
                        question.options[index],
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
