import mapboxgl from 'mapbox-gl'

// Monthly requests => 50,000 free loads
mapboxgl.accessToken = process.env.MAP_BOX_API_KEY

document.addEventListener("turbolinks:load", function(event) {

  try {
    // Check data-lat & data-lon value in the map container
    // Post#show controller send => @location = Geocoder.search(@post.location).first.coordinates
    const lat = document.querySelector("#post-map").dataset.lat
    const lon = document.querySelector("#post-map").dataset.lon
    console.log([lat, lon])

    // Add location map
    var map = new mapboxgl.Map({
      container: 'post-map',
      style: 'mapbox://styles/mapbox/outdoors-v11', // stylesheet location
      center: [lat, lon], // starting position [lng, lat]
      zoom: 9 // starting zoom
    })

    var mapMobile = new mapboxgl.Map({
      container: 'post-map-mobile',
      style: 'mapbox://styles/mapbox/outdoors-v11', // stylesheet location
      center: [lat, lon], // starting position [lng, lat]
      zoom: 9 // starting zoom
    })

    // Add pin on the map
    var marker = new mapboxgl.Marker()
    .setLngLat([lat, lon])
    .addTo(map)
  } catch (e) {
    console.log("No map to display")
  }

})
