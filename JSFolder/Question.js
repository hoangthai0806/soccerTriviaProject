class Question {
  constructor (text, options, correctAnswer){
    this.text = text;
    this.options = options;
    this.correctAnswer = correctAnswer.toUpperCase;
  }
  
  isCorrect(answer){
    return answer === this.correctAnswer;
  }
}