bindTextAreas = () ->
  textAreas = document.querySelectorAll('textarea')

  for textArea in textAreas
    resize({ target: textArea })
    textArea.addEventListener('input', resize)

resize = ({ target: textArea }) ->
  textArea.style.height = '0'
  computedStyle = getComputedStyle(textArea, null)
  accumulatedBorderHeight = (
    parseInt(computedStyle.borderTopWidth, 10) +
    parseInt(computedStyle.borderBottomWidth, 10)
  )
  textArea.style.height = "#{textArea.scrollHeight + accumulatedBorderHeight}px"

document.addEventListener('DOMContentLoaded', bindTextAreas)
