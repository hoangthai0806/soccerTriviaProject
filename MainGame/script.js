import Score from "./score.js";

class QuestionManager {
  constructor(questionContainer) {
    this.questionContainer = questionContainer;
    this.Score = new Score();
    this.questions = [];
    this.currentIndex = 0;
    this.timer = null;
    this.player_id = localStorage.getItem("player_id");
  }

  updateScoreUI() {
    document.getElementById("score").textContent = this.Score.getScore();
    document.getElementById("streak").textContent = "Streak: " + this.Score.getStreak();
  }

  async loadQuestionSet() {
    try {
      const response = await fetch('/get-question');
      this.questions = await response.json();
      this.currentIndex = 0;
      this.displayQuestion(this.questions[this.currentIndex]);
    } catch (err) {
      console.error("Error loading questions:", err);
      this.questionContainer.innerHTML = "<p>Error loading questions.</p>";
    }
  }

  displayQuestion(question) {
document.getElementById("progressBox").innerText =
  `Question ${this.currentIndex + 1}/${this.questions.length}`;
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
    this.startTimer(question.correct_answer);
  }

  checkAnswer(selected, correct) {
    clearInterval(this.timer);
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
    setTimeout(() => this.nextQuestion(), 1500);
  }

  nextQuestion() {
    this.currentIndex++;
    if (this.currentIndex >= this.questions.length) {
      this.showCongratsPopup();
      return;
    }
    this.displayQuestion(this.questions[this.currentIndex]);
  }

  async showCongratsPopup() {
  document.getElementById("finalScoreText").textContent =
    "Your score is: " + this.Score.getScore();
  await fetch('/save-score', {
  method: 'POST',
  headers: { 'Content-Type': 'application/json' },
  body: JSON.stringify({
    player_id: this.player_id,
    score: this.Score.getScore()
  })
});

await this.loadLeaderboard();
  document.getElementById("congratsPopup").style.display = "flex";
}

async loadLeaderboard() {
  try {
    const response = await fetch('/leaderboard');
    const rows = await response.json();
    const list = document.getElementById("leaderboard");
    list.innerHTML = "";
    rows.forEach(row => {
      const li = document.createElement("li");
      li.innerHTML = `<span>${row.player_name}</span> <span>${row.score}</span>`;
      list.appendChild(li);
    });
  } catch (err) {
    console.error("Error loading leaderboard:", err);
  }
}

  restartGame() {
    document.getElementById("progressBox").innerText = "Question 1/5";
    document.getElementById("congratsPopup").style.display = "none";
    this.Score.reset();
    this.updateScoreUI();
    this.loadQuestionSet();
  }
  startTimer(correctAnswer) {
  this.timeLeft = 30;
  document.getElementById("timer").textContent = this.timeLeft + "s";
  this.timer = setInterval(() => {
    this.timeLeft--;
    document.getElementById("timer").textContent = this.timeLeft + "s";
    if (this.timeLeft <= 0) {
      clearInterval(this.timer);
      this.forceTimesUp(correctAnswer);
    }
  }, 1000);
}
forceTimesUp(correct) {
  const buttons = document.querySelectorAll(".answer-btn");
  buttons.forEach(btn => {
    btn.disabled = true;
    if (btn.dataset.answer === correct) {
      btn.style.backgroundColor = "green";
      btn.style.color = "white";
    }
  });
  this.Score.lose();  
  this.updateScoreUI();
  setTimeout(() => this.nextQuestion(), 1500);
}}
export default QuestionManager;