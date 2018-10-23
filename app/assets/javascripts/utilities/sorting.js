document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.sort-by-title')

  if (control) { control.addEventListener('click', sortRowsByTitle) }
})

function sortRowsByTitle() {
  var table = document.querySelector('table')
  var thead = table.querySelector('thead')
  var tbody = table.querySelector('tbody')

  // NodeList
  // https://developer.mozilla.org/ru/docs/Web/API/Nodelist
  rows = tbody.querySelectorAll('tr')
  var sortedRows = []

  // select all table rows
  for (var i = 0; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    this.querySelector('.octicon-arrow-up').classList.add('hide')
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
  }

  var sortedTbody = document.createElement('tbody')
  for (var i = 0; i < sortedRows.length; i++) {
    sortedTbody.appendChild(sortedRows[i])
  }

  tbody.parentNode.replaceChild(sortedTbody, tbody)
}

function compareRowsAsc(row1, row2) {
  var testTitleTag1 = row1.querySelector('th') ? row1.querySelector('th') : row1.querySelector('td')
  var testTitleTag2 = row2.querySelector('th') ? row2.querySelector('th') : row2.querySelector('td')
  var testTitle1 = testTitleTag1.textContent
  var testTitle2 = testTitleTag2.textContent
  if (testTitle1 < testTitle2) { return -1 }
  if (testTitle1 > testTitle2) { return 1 }
  return 0
}

function compareRowsDesc(row1, row2) {
  var testTitleTag1 = row1.querySelector('th') ? row1.querySelector('th') : row1.querySelector('td')
  var testTitleTag2 = row2.querySelector('th') ? row2.querySelector('th') : row2.querySelector('td')
  var testTitle1 = testTitleTag1.textContent
  var testTitle2 = testTitleTag2.textContent
  if (testTitle1 < testTitle2) { return 1 }
  if (testTitle1 > testTitle2) { return -1 }
  return 0
}
