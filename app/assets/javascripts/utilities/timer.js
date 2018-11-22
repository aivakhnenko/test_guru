document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.timer');

  if (control) { setTimer(control); }
})

function setTimer(control) {
  var endTime = control.textContent;
  control.textContent = timeLeft(endTime);
  control.classList.remove('hide');
  setInterval(function() {
    control.textContent = timeLeft(endTime);
  }, 500)
}

function timeLeft(endTime) {
  var seconds, minutes;
  seconds = parseInt((endTime - Date.now()) / 1000, 10);
  console.log(endTime);
  if (seconds < 1) {
    window.location.replace(window.location + '/result');
  }
  minutes = parseInt(seconds / 60, 10);
  seconds = parseInt(seconds % 60, 10);
  return minutes + ':' + (seconds < 10 ? '0' : '') + seconds;
}
