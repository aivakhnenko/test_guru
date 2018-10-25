document.addEventListener('turbolinks:load', function() {
  var controls = document.querySelectorAll('.form-inline-link');

  if (controls.length) {
    for (var i = 0; i < controls.length; i++) {
      controls[i].addEventListener('click', formInlineLinkHandler);
    }
    var errors = document.querySelector('.resource-errors');
    if (errors) {
      var resourceId = errors.dataset.resourceId;
      formInlineHandler(resourceId);
    }
  }

});

function formInlineLinkHandler() {
  event.preventDefault();
  var testId = this.dataset.testId;
  formInlineHandler(testId);
}

function formInlineHandler(testId) {
  var linkEdit = document.querySelector('.form-inline-link-edit[data-test-id="' + testId + '"]');
  var linkCancel = document.querySelector('.form-inline-link-cancel[data-test-id="' + testId + '"]');
  var testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]');
  var formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]');

  if (formInline.classList.contains('hide')) {
    testTitle.classList.add('hide');
    formInline.classList.remove('hide');
    linkEdit.classList.add('hide');
    linkCancel.classList.remove('hide');
  } else {
    testTitle.classList.remove('hide');
    formInline.classList.add('hide');
    linkEdit.classList.remove('hide');
    linkCancel.classList.add('hide');
    var formInput = formInline.querySelector("input[id='test_title']");
    formInput.value = testTitle.textContent;
  }
}
