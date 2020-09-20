let map //変数の定義
let geocoder //変数の定義

function initMap() {
    var map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: gon.lat, lng: gon.lng},
    zoom: 12
    });
    var transitLayer = new google.maps.TransitLayer();
    transitLayer.setMap(map);

    var contentString = '住所：<%= @post.address %>';
    var infowindow = new google.maps.InfoWindow({
      content: contentString
    });

    var marker = new google.maps.Marker({
                  position:{lat: gon.lat, lng: gon.lng},
                  map: map,
                  title: contentString
                 });

     marker.addListener('click', function() {
       infowindow.open(map, marker);
     });
  }