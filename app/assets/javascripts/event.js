/* global $ */
$(function() {
  $('.event-form__release__q-icon').click(function() {
    $('.event-form__release__q-box').stop().fadeToggle(500);
  });
});

// indexページ

// $(function() {
//   $('.event-index--today__box').hide();
// });

// $(function() {
//   $('.event-index--tag__menu').hide();
// });

// $(function() {
//   $('.event-index--group__box').hide();
// });

// $(function() {
//   $('.event-index--invitation__box').hide();
// });

// $(function() {
//   $('.event-index--today__title').click(function() {
//     $('.today-events-icon').toggleClass('icon_rotate');
//     $('.event-index--today__box').slideToggle();
//   });
// });

// $(function() {
//   $('.event-index--tag__title').click(function() {
//     $('.tag-index-icon').toggleClass('icon_rotate');
//     $('.event-index--tag__menu').slideToggle();
//   })
// })

// $(function() {
//   $('.event-index--group__title').click(function() {
//     $('.group-index-icon').toggleClass('icon_rotate');
//     $('.event-index--group__box').slideToggle();
//   })
// })

// $(function() {
//   $('.event-index--invitation__title').click(function() {
//     $('.invitation-index-icon').toggleClass('icon_rotate');
//     $('.event-index--invitation__box').slideToggle();
//   })
// })

// プリセット関連
$(function() {
  $('.preset').hide();
});

$(function() {
  $('.event-new--preset_title').click(function() {
    $('.preset-index-icon').toggleClass('icon_rotate');
    $('.preset').slideToggle();
  })
})

/* global gon */
$(function() {
  for (let n = 0; n < gon.presets.length; n++) {
    $('#preset_' + n).click(function() {
      $('#event_name').val();
      $('#event_place').val();
      $('#event_detail').val();
      $('#event_remarks').val();

      $('#event_name').val(gon.presets[n].name);
      $('#event_place').val(gon.presets[n].place);
      $('#event_detail').val(gon.presets[n].detail);
      $('#event_remarks').val(gon.presets[n].remarks);
    });
  }
});

