function initMap() {
    const map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: gon.lat, lng: gon.lng},
    zoom: 14
    });
    const transitLayer = new google.maps.TransitLayer();
    transitLayer.setMap(map);

    const contentString = '住所：<%= @post.address %>';
    const infowindow = new google.maps.InfoWindow({
      content: contentString
    });

    const marker = new google.maps.Marker({
                  position:{lat: gon.lat, lng: gon.lng},
                  map: map,
                  title: contentString
                 });

     marker.addListener('click', function() {
       infowindow.open(map, marker);
     });
  }