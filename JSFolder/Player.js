class Player { //Ben
  static nextId = 1;
  constructor(name) {
    this.id = Player.nextId++;
    this.name = name;
    this.score = 0;       
    this.streak = 0;      
    this.currentAnswer = null;  
  }

  answerQuestion(answer, correctAnswer) {
    this.currentAnswer = answer.toUpperCase(); 
    if (this.currentAnswer === correctAnswer.toUpperCase()) {
      this.streak++;                        
      const points = 10 * this.streak;      // points increase for answering in streaks
      this.addScore(points);
      return true; // correct
    } else {
      this.streak = 0; // reset streak if wrong
      return false;    // incorrect
    }
  }

  addScore(points) {
    this.score += points;
  }

  reset() {
    this.score = 0;
    this.streak = 0;
    this.currentAnswer = null;
  }

  getStats() {
    return {
      id: this.id,
      name: this.name,
      score: this.score,
      streak: this.streak
    };
  }
}

