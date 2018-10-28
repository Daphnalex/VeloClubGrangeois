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
//= require owl.carousel
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

      $('.modal').modal();

      $(".dropdown-trigger").dropdown();

      $('.carousel').carousel({
        'fullWidth': true,
        'indicators': true
      });
      var albumInterval = setInterval(function(){
        $('.carousel.show_album').carousel('next');
      }, 8000);
      var articlesInterval = setInterval(function(){
        $('.carousel.articles_carousel').carousel('next');
      }, 5000);

      $('nav a').click(function(){
        clearInterval(albumInterval);
        albumInterval = null;
        clearInterval(articlesInterval);
        articlesInterval = null;
        $('.modal').modal('destroy');
      });

      $('.image-gallery').mouseenter(function(){
        $(this).css({
          'border': '2px solid white'
        })
      });

      $('.image-gallery').mouseleave(function(){
        $(this).css({
          'border': 'inherit'
        })
      });

      $('.current-image').click(function(){
        console.log('current', $(this).attr('src'));
        getCurrentImage($(this).attr('src'));
      });

      //open modal if image is clicked
      function getCurrentImage(source){
        console.log("dans la fonction pour ajouter la source", source);
        $('#image_modal_album_presentation').attr('src', source);
      };

      $('.current-image-album').click(function(){
        console.log('current album', $(this).attr('src'));
        getCurrentImageAlbum($(this).attr('src'));
      })

      function getCurrentImageAlbum(source){
        console.log('dans la fn pour + la source', source);
        $('#image_modal').attr('src',source);
      }

      //open sidenav to the right of screen
      // $('.sidenav').sidenav({
      //   menuWidth: 300,
      //   closeOnClick: true,
      //   edge: 'right',
      //   onCloseEnd: true
      // });
      var elem = document.querySelector('.sidenav');
      var instance = M.Sidenav.init(elem, {
        onCloseEnd: function () {
            console.log('I close');
          },
          onCloseStart: function(){
            console.log('close start');
          },
          onOpenEnd: function(){
            console.log('open end');
          },
          onOpenStart: function(){
            console.log('open start');
          }
      });

      $('ul.sidenav a').click(function(){
         console.log('clic');
         instance.destroy();
      })

    //$('.collapsible').collapsible();

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
    $('.cell-content-stock').css("height", $('.cell-content-stock').width());
    $('.calque-stock').css({
      "height": $('.cell-content-stock').height(),
      "width": $('.cell-content-stock').width()
    });

    $('div.cell-stock').mouseenter(function(){
      console.log('survol');
      $(this).find('.calque-stock').css({
        'display':'block',
        'width': $(this).find('.cell-content-stock').width()
        });
    });
    $('div.cell-stock').mouseleave(function(){
      console.log('survol');
      $(this).find('.calque-stock').css('display','none');
    });

    $('.stock-images').mouseenter(function(){
      $(this).find('.stock-front').css("display","none");
    });

    $('.stock-images').mouseleave(function(){
      $(this).find('.stock-front').css("display","block");
    });

    $(".owl-carousel").owlCarousel({
      nav: true
    });

    $('.image_album').mouseenter(function(){
      $(this).find('img').css({
        'opacity': 0.5
      });
      $(this).find('.see_album').css({
        'position': 'absolute',
        'margin-top': $(this).height()/2 -13,
        'width':  $(this).find('img').width() + 'px',
        'display': 'block',
        'margin-left': '0px',
        'text-align': 'center'
      },
      console.log('hauteur', $(this).find('img').width()))
    });

    $('.image_album').mouseleave(function(){

      $(this).find('img').css({
        'opacity': 1
      });

      $(this).find('.see_album').css({
        'position': 'inherit',
        'margin-top': 'inherit',
        'width':  'inherit',
        'display': 'none'
      });

    });

    if ($('p.alert').text() == ""){
      console.log('pas de message');
      $('p.alert').css({
        'display': 'none',
        'margin-top': '0px'
      });
    } else {
      console.log('message', $('p.alert').text());
      $('.page-content').css({
        'margin-top': '40px'
      });
      $("p.alert").fadeIn().delay(2000).fadeOut(2000);
    };

    if ($('p.notice').text() == ""){
      console.log('pas de message');
      $('p.notice').css({
        'display': 'none',
        'margin-top': '0px'
      });
    } else {
      console.log('message', $('p.alert').text());
      $('.page-content').css({
        'margin-top': '40px'
      });
      $("p.notice").fadeIn().delay(2000).fadeOut(2000);
    };



  });


function delete_image(album,picture){
  console.log('album', album);
}

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
  console.log(number)
  // if (number != 'nil'){
  //   var phone = number.slice(0,2)+'-'+number.slice(2,4)+'-'+number.slice(4,6)+'-'+number.slice(6,8)+'-'+number.slice(8,10);
  //   return phone;
  // }
}
