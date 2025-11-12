class Score {
  constructor() {
    this.currentScore = 0;
    this.streak = 0;
  }
  win() {
    this.streak++;
    const pointsEarned = 10 * this.streak;
    this.currentScore += pointsEarned;
    console.log(`Win! +${pointsEarned} points (Streak: ${this.streak})`);
    return pointsEarned;
  }
  lose() {
    console.log(`Lose! Streak reset.`);
    this.streak = 0;
  }
  reset() {
    this.currentScore = 0;
    this.streak = 0;
  }
  getScore() {
    return this.currentScore;
  }
  getStreak() {
    return this.streak;
  }
}



class QuestionManager {
  constructor(questionContainer) {
    this.questionContainer = questionContainer;
  }

  async loadQuestion() {
    try {
      const response = await fetch('/get-question');
      const question = await response.json();

      this.displayQuestion(question);
    } catch (error) {
      console.error('Error loading question:', error);
      this.questionContainer.innerHTML = '<p>Error loading question.</p>';
    }
  }

  displayQuestion(question) {
    this.questionContainer.innerHTML = `
      <div class="question-box">
        <h2>${question.question_text}</h2>
        <ul class="options">
          <li><button data-answer="a">${question.option_a}</button></li>
          <li><button data-answer="b">${question.option_b}</button></li>
          <li><button data-answer="c">${question.option_c}</button></li>
          <li><button data-answer="d">${question.option_d}</button></li>
        </ul>
      </div>
    `;
  }
}

export default QuestionManager;
