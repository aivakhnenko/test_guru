document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.progress-bar-line');

  if (control) {
    var current = control.dataset.current;
    var total = control.dataset.total;
    var width = (current / total) * 100;
    control.style.width = width + '%';
  }
});
