
// Try the following if you end up reinstating Ajax for checkins,
// as it supposedly resets the multi_select. 
// UPDATE - this one line is what I needed all along to get the chosen plugin
// to play nice with Ajax
$("#checkin_tag_ids").val('').trigger("liszt:updated");

//$("li.search-choice").hide();
//$("ul.chzn-choices li.search-choice").remove();
//$("ul.chzn-results li.result-selected").attr("class", "active-result");
$("ul.chzn-choices li.search-field input").removeAttr("class");
//$("ul.chzn-choices li.search-field input").val("tags");

$("#checkin-text-fields").hide();
$("#hide-checkin-form").hide();
$("#view-checkin-form").show();

$("#checkin_title").val("");
$("#checkin_content").val("");

$(".alert").hide();

$('#checkin-count').html(parseInt($('#checkin-count').html(), 10)+1);

alert("check-in successful!");