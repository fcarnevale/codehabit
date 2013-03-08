$(function(){
  
  $("#checkin-text-fields").hide();
  $("#hide-checkin-form").hide();

  $("#view-checkin-form").click(function(event){
    event.preventDefault();
    $(this).hide();
    $("#hide-checkin-form").show();
    $("#checkin-text-fields").show();
  });

  $("#hide-checkin-form").click(function(event){
    event.preventDefault();
    $(this).hide();
    $("#view-checkin-form").show();
    $("#checkin-text-fields").hide();
  });

});