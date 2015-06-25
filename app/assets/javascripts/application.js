// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.en-GB.js
//= require_tree .

var newPet_toggle = function() {
  if ($(this).hasClass('open')) {
    $("#newPet").slideUp(350);
    $(this).removeClass('open');
  } else {
    $(this).addClass('open');
    $("#newPet").slideDown(350);
  }
}

var ready = function() {
  $('#table_id').DataTable();
  $('.clickable').click( function() {
    window.location = $(this).parent().children().first().find('a').attr('href')
  });
}

var hover_toggle = function() {
  $(this).toggleClass('hover');
}

$(document).ready(ready).hover(hover_toggle);
$(document).on('page:load', ready).hover(hover_toggle);
$(document).on("click","#userPet", newPet_toggle);
