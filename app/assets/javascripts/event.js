/* global $ */
$(function() {
  $('.event-new--question_icon').click(function() {
    $('.event-new--question_box').stop().fadeToggle(500);
  });
});

$(function() {
  $('.event-edit--question_icon').click(function() {
    $('.event-edit--question_box').stop().fadeToggle(500);
  });
});
