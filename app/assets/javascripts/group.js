/* global $ */
$(function() {
  $('.group-show--group_member_box').hide();
});

$(function() {
  $('.group-show--invitation_member_box').hide();
});

$(function() {
  $('.group-show--group_member_title').click(function() {
    $('.group-member-icon').toggleClass('icon_rotate');
    $('.group-show--group_member_box').slideToggle();
  });
});

$(function() {
  $('.group-show--invitation_member_title').click(function() {
    $('.group-invitation-icon').toggleClass('icon_rotate');
    $('.group-show--invitation_member_box').slideToggle();
  });
});