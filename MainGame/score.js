class Score {
  constructor() {
    this.currentScore = 0;
    this.streak = 0;
  }
  win() {
    this.streak++;
    const pointsEarned = 10 * this.streak;
    this.currentScore += pointsEarned;
    return pointsEarned;
  }
  lose() {
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
export default Score;