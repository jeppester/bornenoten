contactsInput = null

window.bindContactsInput = =>
  contactsInput = document.querySelector('.contacts-input')
  contactsInput.addEventListener 'input', updateEmptyRows
  contactsInput.addEventListener 'click', toggleRow

###########################
## Automatic creation of new empty rows
###########################
updateEmptyRows = =>
  emptyRows = getEmptyRows()
  if emptyRows.length > 0
    focused = emptyRows.find(getContactRowIsFocused)
    if focused
      row.parentNode.removeChild(row) for row in emptyRows when row != focused
    else
      row.parentNode.removeChild(row) for row in emptyRows.slice(1)
  else
    addEmptyRow()

getEmptyRows = =>
  newRows = Array.from(contactsInput.querySelectorAll('.contacts-input__row--new'))
  newRows.filter(getContactRowIsBlank)

getContactRowIsBlank = (row) =>
  (
    Array.from(row.querySelectorAll('input')).map(({ value }) => value).join('') == '' &&
    row.querySelector('select').selectedIndex == 0
  )

getContactRowIsFocused = (row) =>
  Array.from(row.querySelectorAll('input, select')).some((element) => element == document.activeElement)

addEmptyRow = =>
  lastNewRow = Array.from(contactsInput.querySelectorAll('.contacts-input__row--new')).pop()
  row = lastNewRow.cloneNode(true)

  for element in row.querySelectorAll('input, select')
    element.value = ''
    element.name = element.name.replace(
      /child\[contacts_attributes\]\[(\d+)\]/,
      (match, index) =>
        "child[contacts_attributes][#{parseInt(index) + 1}]"
    )
  contactsInput.appendChild(row)

###########################
## Deletion of rows
###########################
toggleRow = ({ target, currentTarget }) =>
  destroyButton = getToggleButton(target)
  return unless destroyButton

  row = destroyButton.parentNode
  destroyInput = row.querySelector('.contacts-input__destroy-button')

  destroy = !parseInt(destroyInput.value)
  destroyInput.value = if destroy then '1' else '0'
  destroyButton.classList.toggle 'contacts-input__destroy-button--active', destroy
  element.disabled = destroy for element in row.querySelectorAll('input:not([type="hidden"]), select')

getToggleButton = (target) =>
  testElement = target
  while testElement
    return testElement if testElement.classList && testElement.classList.contains('contacts-input__destroy-button')
    testElement = testElement.parentNode
  false
