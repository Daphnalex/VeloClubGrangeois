$(document).ready(function(){
  $(".div-avatar").click(function() {
    $(".avatar-image").removeClass("active");
    $(this).children("img").addClass("active");
  });
});