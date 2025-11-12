document.querySelector("form").addEventListener("submit", async (e) => {
  e.preventDefault();

  const name = document.querySelector(".name").value.trim();
  const email = document.querySelectorAll(".form-control")[1].value.trim();
  const password = document.querySelectorAll(".form-control")[2].value.trim();
  const confirmPassword = document.querySelectorAll(".form-control")[3].value.trim();

  const messageBox = document.createElement("p");
  messageBox.style.textAlign = "center";
  messageBox.style.marginTop = "10px";
  document.querySelector("form").appendChild(messageBox);

  if (!name || !email || !password || !confirmPassword) {
    messageBox.textContent = " Please fill in all fields.";
    messageBox.style.color = "red";
    return;
  }

  if (password !== confirmPassword) {
    messageBox.textContent = "Passwords do not match.";
    messageBox.style.color = "red";
    return;
  }

  try {
    const response = await fetch("/register", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({player_name: name ,player_email: email, player_password: password }),
    });

    const result = await response.text();

    if (response.ok) {
      messageBox.textContent = "Registration successful! Redirecting to login...";
      messageBox.style.color = "green";
      setTimeout(() => {
        window.location.href = "/";
      }, 2000);
    } else {
      messageBox.textContent = result;
      messageBox.style.color = "red";
    }
  } catch (error) {
    console.error("Error:", error);
    messageBox.textContent = "Server error. Please try again later.";
    messageBox.style.color = "red";
  }
});

