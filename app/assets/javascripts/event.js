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

// indexページ

$(function() {
  $('.event-index--today_event_box').hide();
});

$(function() {
  $('.event-index--group_link_box').hide();
});

$(function() {
  $('.event-index--dropdown_menu').hide();
});

$(function() {
  $('.event-index--invitation_group_box').hide();
});

$(function() {
  $('.event-index--today_event_title').click(function() {
    $('.today-events-icon').toggleClass('icon_rotate');
    $('.event-index--today_event_box').slideToggle();
  });
});

$(function() {
  $('.event-index--tag_title').click(function() {
    $('.tag-index-icon').toggleClass('icon_rotate');
    $('.event-index--dropdown_menu').slideToggle();
  })
})

$(function() {
  $('.event-index--group_title').click(function() {
    $('.group-index-icon').toggleClass('icon_rotate');
    $('.event-index--group_link_box').slideToggle();
  })
})

$(function() {
  $('.event-index--invitation_group_title').click(function() {
    $('.invitation-index-icon').toggleClass('icon_rotate');
    $('.event-index--invitation_group_box').slideToggle();
  })
})


