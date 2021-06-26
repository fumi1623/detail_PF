/* global $ */
$(function() {
  $('.group-show--member-box').hide();
});

$(function() {
  $('.group-show--invitation-title__box').hide();
});

$(function() {
  $('.group-show--member-title').click(function() {
    $('.group-member-icon').toggleClass('icon_rotate');
    $('.group-show--member-box').slideToggle();
  });
});

$(function() {
  $('.group-show--invitation-title').click(function() {
    $('.group-invitation-icon').toggleClass('icon_rotate');
    $('.group-show--invitation-title__box').slideToggle();
  });
});