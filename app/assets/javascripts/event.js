/* global $ */
/* global gon */
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

$(function() {
  for (let n = 0; n < gon.presets.length; n++) {
    $('#preset_' + n).click(function() {
      $('#event_name').val()
      $('#event_place').val()
      $('#event_detail').val()
      $('#event_remarks').val()

      $('#event_name').val(gon.presets[n].name)
      $('#event_place').val(gon.presets[n].place)
      $('#event_detail').val(gon.presets[n].detail)
      $('#event_remarks').val(gon.presets[n].remarks)
    })
  }
})

