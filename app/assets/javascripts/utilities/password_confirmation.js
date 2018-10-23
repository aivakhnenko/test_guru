document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector(".check-password-confirmation")

  if (control) { control.addEventListener('input', checkPasswordConfirmation) }
})

function checkPasswordConfirmation() {
  var icon_ok = this.parentNode.querySelector(".octicon-check")
  var icon_no = this.parentNode.querySelector(".octicon-x")
  var pass2 = this.value
  if (pass2) {
    pass1 = document.querySelector("input[id='user_password']").value
    if (pass1 == pass2) {
      icon_ok.classList.remove('hide')
      icon_no.classList.add('hide')
    } else {
      icon_ok.classList.add('hide')
      icon_no.classList.remove('hide')
    }
  } else {
    icon_ok.classList.add('hide')
    icon_no.classList.add('hide')
  }
}
