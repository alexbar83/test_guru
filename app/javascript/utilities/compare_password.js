document.addEventListener("turbolinks:load", function() {
  var user_password = document.querySelector("#user_password");
  var user_password_confirmation = document.querySelector(
    "#user_password_confirmation"
  );

  if (user_password && user_password_confirmation) {
    document.querySelector(".octicon-primitive-dot").classList.add("hide");
    user_password.addEventListener("input", compare_passwords);
    user_password_confirmation.addEventListener("input", compare_passwords);
  }
});

function compare_passwords() {
  var primitive_dot = document.querySelector(".octicon-primitive-dot");
  if (user_password.value != user_password_confirmation.value) {
    primitive_dot.classList.remove("hide");
    primitive_dot.classList.remove("green_color");
    primitive_dot.classList.add("red_color");
  }

  if (user_password.value == user_password_confirmation.value) {
    primitive_dot.classList.remove("hide");
    primitive_dot.classList.remove("red_color");
    primitive_dot.classList.add("green_color");
  }

  if (user_password_confirmation.value == "") {
    primitive_dot.classList.add("hide");
  }
}
