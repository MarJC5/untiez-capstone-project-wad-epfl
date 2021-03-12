import places from 'places.js'

document.addEventListener("turbolinks:load", function(event) {

  // Add location suggestion
  try {
    const searchInput = document.querySelector('#address-input')

    var placesAutocomplete = places({
      container: searchInput
    })
  } catch (e) {
    console.log("No algolia search input here.")
  }
})
