document.querySelector("form").addEventListener("submit", async (e) => {
  e.preventDefault();

  const email = document.querySelectorAll(".form-control")[0].value.trim();
  const password = document.querySelectorAll(".form-control")[1].value.trim();
  const errorBox = document.getElementById("error-message");

  if (!email || !password) {
    errorBox.textContent = "Please enter both email and password.";
    errorBox.style.color = "red";
    return;
  }

  try {
    const response = await fetch("/login", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        player_email: email,
        player_password: password
      }),
    });

    const data = await response.json();

    if (response.ok) {
      localStorage.setItem("player_id", data.player_id);
      localStorage.setItem("player_name", data.player_name);

      errorBox.textContent = "Login successful! Redirecting...";
      errorBox.style.color = "green";

      setTimeout(() => {
        window.location.href = "/MainGame/home.html";
      }, 1500);
    } else {
      errorBox.textContent = "Your Username or Password is incorrect.";
      errorBox.style.color = "red";
    }
  } catch (error) {
    console.error("Error:", error);
    errorBox.textContent = "Server error. Please try again later.";
    errorBox.style.color = "red";
  }
});
