document.querySelector("form").addEventListener("submit", async (e) => {
  e.preventDefault();

  const email = document.querySelectorAll(".form-control")[0].value;
  const password = document.querySelectorAll(".form-control")[1].value;

  const response = await fetch("/api/login", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ email, password }),
  });

  const result = await response.json();
  alert(result.message);

  if (result.message === "Login successful!") {
    // Redirect to your game page (for now, just alert)
    alert("Welcome back!");
  }
});
