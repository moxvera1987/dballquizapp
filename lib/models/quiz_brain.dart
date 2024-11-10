import 'package:dballquizapp/models/question_model.dart';

final List<QuestionModel> questions = [
  QuestionModel(
    imageUrl: 'assets/img/goku.JPG',
    questionText: '¿Cuál es el nombre del personaje en la imagen?',
    options: ['Radits', 'Guko', 'Coku', 'Goku'],
    correctOptionIndex: 3,
  ),
  QuestionModel(
    imageUrl: 'assets/img/krilin.JPG',
    questionText: '¿Cuál es el nombre del personaje en la imagen?',
    options: ['Yamcha', 'Krilin', 'Napa', 'Krillin'],
    correctOptionIndex: 1,
  ),
  QuestionModel(
    imageUrl: 'assets/img/bulma.JPG',
    questionText: '¿Cuál es el nombre del personaje en la imagen?',
    options: ['Bulma', 'Maron', 'Bulba', 'Balmu'],
    correctOptionIndex: 0,
  ),
  QuestionModel(
    imageUrl: 'assets/img/vegueta.JPG',
    questionText: '¿Cuál es el nombre del personaje en la imagen?',
    options: ['Vejetal', 'Vendetta', 'Dodoria', 'Vegueta'],
    correctOptionIndex: 3,
  ),
  QuestionModel(
    imageUrl: 'assets/img/sra_brief.JPG',
    questionText: '¿Cuál es el nombre del personaje en la imagen?',
    options: ['Dr Brief', 'Bulma', 'Panchi', 'N° 18'],
    correctOptionIndex: 2,
  ),
];
