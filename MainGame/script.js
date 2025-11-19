import Score from "./score.js";

class QuestionManager {
  constructor(questionContainer) {
    this.questionContainer = questionContainer;
    this.Score = new Score();
    this.shownQuestions = [];
  }

  updateScoreUI() {
    document.getElementById("score").textContent = this.Score.getScore();
    document.getElementById("streak").textContent =
      "Streak: " + this.Score.getStreak();
  }

  async loadQuestion() {
    try {
      const response = await fetch('/get-question');
      const question = await response.json();
      this.displayQuestion(question);
    } catch (error) {
      console.error("Error loading question:", error);
      this.questionContainer.innerHTML = "<p>Error loading question.</p>";
    }
  }

  displayQuestion(question) {
this.questionContainer.innerHTML = `
  <div class="qa-card">
      <h2 class="question-text">${question.question_text}</h2>

      <div class="answer-buttons">
          <button class="answer-btn" data-answer="A">${question.option_a}</button>
          <button class="answer-btn" data-answer="B">${question.option_b}</button>
          <button class="answer-btn" data-answer="C">${question.option_c}</button>
          <button class="answer-btn" data-answer="D">${question.option_d}</button>
      </div>
  </div>
`;


    document.querySelectorAll(".answer-btn").forEach((btn) => {
      btn.addEventListener("click", () =>
        this.checkAnswer(btn.dataset.answer, question.correct_answer)
      );
    });
  }

  checkAnswer(selected, correct) {
    const buttons = document.querySelectorAll(".answer-btn");

    buttons.forEach((btn) => (btn.disabled = true));

    buttons.forEach((btn) => {
      if (btn.dataset.answer === correct) {
        btn.style.backgroundColor = "green";
        btn.style.color = "white";
      }
    });

    if (selected !== correct) {
      const wrongBtn = [...buttons].find(
        (btn) => btn.dataset.answer === selected
      );
      wrongBtn.style.backgroundColor = "red";
      wrongBtn.style.color = "white";
      this.Score.lose();
    } else {
      this.Score.win();
    }

    this.updateScoreUI();
    setTimeout(() => this.loadQuestion(), 1500);
  }
}

export default QuestionManager;
