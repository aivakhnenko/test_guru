document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.timer');

  if (control) { setTimer(control); }
})

var timer;

function setTimer(control) {
  var endTime = control.textContent;
  control.textContent = timeLeft(endTime);
  control.classList.remove('hide');
  timer = setInterval(function() {
    control.textContent = timeLeft(endTime);
  }, 500)
}

function timeLeft(endTime) {
  var time, seconds, minutes;
  time = endTime - Date.now();
  if (time <= 0) {
    clearInterval(timer);
    document.querySelector('.test-attempt-form').submit();
  }
  seconds = Math.round(time / 1000);
  minutes = Math.floor(seconds / 60);
  seconds = seconds % 60;
  return minutes + ':' + (seconds < 10 ? '0' : '') + seconds;
}
