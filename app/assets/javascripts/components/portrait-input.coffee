imageElement = null
changeButton = null
removeButton = null

fileInput = null
removeInput = null

placeholderURL = null

window.bindPortraitInput = (options) =>
  placeholderURL = options.placeholderURL

  imageElement = document.querySelector('.portrait-input__image')
  changeButton = document.querySelector('.portrait-input__action--change')
  removeButton = document.querySelector('.portrait-input__action--remove')

  fileInput = document.querySelector('.portrait-input__field--file')
  removeInput = document.querySelector('.portrait-input__field--remove')

  changeButton.addEventListener 'click', openImageSelector
  removeButton.addEventListener 'click', removeImage

  fileInput.addEventListener 'change', changeImage

openImageSelector = () =>
  fileInput.click()

changeImage = () =>
  if fileInput.files[0]
    setImage(fileInput.files[0])
  else
    removeImage()

setImage = (image) =>
  removeInput.checked = false
  url = URL.createObjectURL(image)
  imageElement.style.backgroundImage = "url('#{url}')"
  removeButton.classList.remove('portrait-input__action--disabled')

removeImage = () =>
  removeInput.checked = true
  imageElement.style.backgroundImage = "url('#{placeholderURL}')"
  removeButton.classList.add('portrait-input__action--disabled')
