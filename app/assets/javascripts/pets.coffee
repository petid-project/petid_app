$(document).ready ->
  $("#pet_form").on("ajax:success", (e, data, status, xhr) ->
    $("#pet_form").append xhr.responseText
  ).on "ajax:error", (e, xhr, status, error) ->
