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
      $('.carousel.carousel-slider').carousel({
        fullWidth: true,
        indicators: true
      });

      $('.modal').modal();
      $('.sidenav').sidenav();
  })




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
