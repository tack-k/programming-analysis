$(function() {
 
  $(".button").on("click", function() {

    $(this).closest("div").css("display", "none")
    id = $(this).attr("href");
    $(id).show("fast")
    return false;
   });
  
  })