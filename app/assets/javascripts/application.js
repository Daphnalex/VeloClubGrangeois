// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require ckeditor/init
//= require rails-ujs
//= require activestorage
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require turbolinks
//= require materialize
//= require materialize-sprockets
//= require jquery.slick
//= require_tree .


  $( document ).on('turbolinks:load', function() {
    console.log("Jquery works !");

    $( ".datepicker" ).datepicker({
      altField: ".datepicker",
      closeText: 'Fermer',
      prevText: 'Précédent',
      nextText: 'Suivant',
      currentText: 'Aujourd\'hui',
      monthNames: ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'],
      monthNamesShort: ['Janv.', 'Févr.', 'Mars', 'Avril', 'Mai', 'Juin', 'Juil.', 'Août', 'Sept.', 'Oct.', 'Nov.', 'Déc.'],
      dayNames: ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'],
      dayNamesShort: ['Dim.', 'Lun.', 'Mar.', 'Mer.', 'Jeu.', 'Ven.', 'Sam.'],
      dayNamesMin: ['D', 'L', 'M', 'M', 'J', 'V', 'S'],
      weekHeader: 'Sem.',
      dateFormat: 'dd/mm/yy'
      });

      $(".error").show().delay(3000).fadeOut();
      // $('.slider').slick({
      //   slidesToShow: 4,
      //   slidesToScroll: 4,
      //   dots: true
      // });

      $('.articles_carousel.carousel.carousel-slider').carousel({
        fullWidth: true,
        indicators: true
      }, setTimeout(autoplayArticles, 4500));

      function autoplayArticles() {
        $('.articles_carousel.carousel').carousel('next');
        setTimeout(autoplayArticles, 4500);
      }

      $('.album_carousel.carousel.carousel-slider').carousel({
        fullWidth: true,
        indicators: true
      }, setTimeout(autoplayAlbum, 4500));

      function autoplayAlbum() {
        $('.album_carousel.carousel').carousel('next');
        setTimeout(autoplayAlbum, 4500);
      }

      $('.modal').modal();


      $('.current-image').click(function(){
        console.log('current', $(this).attr('src'));
        getCurrentImage($(this).attr('src'));
      });

      //open modal if image is clicked
      function getCurrentImage(source){
        console.log("dans la fonction pour ajouter la source", source);
        $('#image_modal_album_presentation').attr('src', source);
      };

      //open sidenav to the right of screen
      $('.sidenav').sidenav({
        menuWidth: 300,
        closeOnClick: true,
        edge: 'right', // <--- CHECK THIS OUT
      });
    $('.collapsible').collapsible();

    //hide image stock in home when hover it
    $('.parent-clothes').mouseenter(function(){
      $(this).children('.first-child').css('display','none');
      $(this).children('.second-child').css('display','block');
    });

    $('.parent-clothes').mouseleave(function(){
      $('.first-child').css('display','block');
      $(this).children('.second-child').css('display','none');
    });

    //size of stock-home is egal to height of picture
    $('div.stock-home:has(img.clothes)').css("height", $('img.clothes').height());
    
  });




function verif_nombre(champ){
	var chiffres = new RegExp("[0-9]");
	var verif;
	var points = 0;

	for(x = 0; x < champ.value.length; x++)
	{
    verif = chiffres.test(champ.value.charAt(x));
	  if(champ.value.charAt(x) == "."){
      points++;
    }
    if(points > 1){
      verif = false;
      points = 1;
    }
  	if(verif == false){
      champ.value = champ.value.substr(0,x) + champ.value.substr(x+1,champ.value.length-x+1);
      x--;
    }
	}
}

function transform_phone(number){
  var phone = number.slice(0,2)+'-'+number.slice(2,4)+'-'+number.slice(4,6)+'-'+number.slice(6,8)+'-'+number.slice(8,10);
  return phone;
}
