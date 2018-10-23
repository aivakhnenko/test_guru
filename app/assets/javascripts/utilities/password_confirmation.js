document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector(".check-password-confirmation");

  if (control) { control.addEventListener('input', checkPasswordConfirmation); }
})

function checkPasswordConfirmation() {
  var iconOk = this.parentNode.querySelector(".octicon-check");
  var iconNo = this.parentNode.querySelector(".octicon-x");
  var pass2 = this.value;
  if (pass2) {
    pass1 = document.querySelector("input[id='user_password']").value;
    if (pass1 == pass2) {
      iconOk.classList.remove('hide');
      iconNo.classList.add('hide');
    } else {
      iconOk.classList.add('hide');
      iconNo.classList.remove('hide');
    }
  } else {
    iconOk.classList.add('hide');
    iconNo.classList.add('hide');
  }
}
