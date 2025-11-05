document.querySelector("form").addEventListener("submit", async (e) => {
  e.preventDefault();

  const name = prompt("Enter your name:");
  const email = document.querySelectorAll(".form-control")[0].value;
  const password = document.querySelectorAll(".form-control")[1].value;
  const confirmPassword = document.querySelectorAll(".form-control")[2].value;

  if (password !== confirmPassword) {
    alert("Passwords do not match!");
    return;
  }

  const response = await fetch("/api/register", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({ name, email, password }),
  });

  const result = await response.json();
  alert(result.message);

  if (result.message === "Registration successful!") {
    window.location.href = "/";
  }
});
