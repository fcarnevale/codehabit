$(function(){
  
  $("#checkin-text-fields").hide();
  $("#hide-checkin-form").hide();
  $("ul.chzn-choices li.search-field input").removeAttr("class");

  $("#view-checkin-form").click(function(event){
    event.preventDefault();
    $(this).hide();
    $("ul.chzn-choices li.search-field input").attr("style", "width: 50px;");
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