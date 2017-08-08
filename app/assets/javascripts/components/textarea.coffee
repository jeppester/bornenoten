bindTextAreas = () ->
  textAreas = document.querySelectorAll('textarea')

  for textArea in textAreas
    resize({ target: textArea })
    textArea.addEventListener('input', resize)

resize = ({ target: textArea }) ->
  textArea.style.height = '0'
  computedStyle = getComputedStyle(textArea, null)
  newHeight = textArea.scrollHeight

  if computedStyle.boxSizing == 'content-box'
    newHeight -= parseInt(computedStyle.paddingTop, 10)
    newHeight -= parseInt(computedStyle.paddingBottom, 10)
  else
    newHeight += parseInt(computedStyle.borderTopWidth, 10)
    newHeight += parseInt(computedStyle.borderBottomWidth, 10)

  textArea.style.height = "#{newHeight}px"

document.addEventListener('DOMContentLoaded', bindTextAreas)
