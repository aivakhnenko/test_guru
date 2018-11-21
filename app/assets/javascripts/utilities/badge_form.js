document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector(".badge-type");

  if (control) { control.querySelector("select").addEventListener('input', showAttributes); }
})

function showAttributes() {
  var category = document.querySelector(".badge-category");
  var level = document.querySelector(".badge-level");
  console.log(this.value);
  switch (this.value) {
    case 'category':
      category.classList.remove('hide');
      level.classList.add('hide');
      break;
    case 'level':
      category.classList.add('hide');
      level.classList.remove('hide');
      break;
    default:
      category.classList.add('hide');
      level.classList.add('hide');
  }
}
