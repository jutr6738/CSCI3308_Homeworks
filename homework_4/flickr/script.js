//source: https://stackoverflow.com/questions/3898130/check-if-a-user-has-scrolled-to-the-bottom
$(window).scroll(function() {
  if($(window).scrollTop() + $(window).height() +5 >= $(document).height()) {
  makeApiCall(10);
  }
});


function makeApiCall(numphotos) {

  var inputtags= $(document.getElementById("tag_textbox")).val();
    console.log(inputtags);


  //Flikr API Call 
 var url ='https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=b3a4a4d6ab05777ecd8f7a89b28f0af1&tags='+inputtags+'&privacy_filter=1&safe_search=1&extras=url_q&per_page='+numphotos+'&format=json&nojsoncallback=1'; 
  
 $.ajax({url:url, dataType:"json"}).then(function(data) {
    //review all of data returned
    console.log(data);

    print_photos(numphotos,data);

    }) 
  


}//end of makeApiCall function


function print_photos(numphotos,data) {

  var card="";

  for (var i=0; i<numphotos; i++)
  {

    card += " <div class=\"card-deck \">"
    card += " <div class=\"card \">"
    card += " <div style=\" width:100% \"> "

    card +=  '<img src=' + data.photos.photo[i].url_q + '>' 
    card += '<h5 class= "card-title">' + data.photos.photo[i].title + " </h5>"  


    card += "</div>"
    card += "</div>"
    card += "</div>"

  
  }
  $("#image-display").append(card);
}