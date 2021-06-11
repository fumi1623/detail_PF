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


// tagのdropdownメニュー
$(function() {
  $('.event-index--dropdown_menu').hide();
});

$(function() {
  $('.event-index--tag_title').click(function() {
    $('.event-index--dropdown_menu').slideToggle();
  })
})