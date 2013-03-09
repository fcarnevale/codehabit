$("li.search-choice").hide();
$("ul.chzn-choices li.search-choice").remove();
$("ul.chzn-results li.result-selected").attr("class", "active-result");
$("ul.chzn-choices li.search-field input").removeAttr("class");
$("ul.chzn-choices li.search-field input").val("tags");

$("#checkin-text-fields").hide();
$("#hide-checkin-form").hide();
$("#view-checkin-form").show();

$("#checkin_title").val("");
$("#checkin_content").val("");

$(".alert").hide();

alert("check-in successful!");