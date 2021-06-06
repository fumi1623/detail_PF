/* global $ */
$(function() {
  $('.event-new--question_icon').click(function() {
    $('.event-new--question_box').stop().fadeToggle(500);
  });
});

// // 以下googleMap情報


// $(function () {
//   if ($('#pinBox').length > 0) {
//     $('#pinBox').children('.pin-lat').each(function (index, element) {
//       console.log($(element).data('lat'))
//     })
//     $('#pinBox').children('.pin-lon').each(function (index, element) {
//       console.log($(element).data('lon'))
//     })
//   }
// })
