function load() {
  console.log('aaa')

  var headerJs = $('#js-header');

  $('.header-menu').on('click', function(e) {
    e.preventDefault();
    headerJs.toggleClass('open')
  });

//ブレイクポイント超えると解除する
var pcWidth = window.matchMedia('screen and (min-width: 897px)');
function checkBreakPoint() {
  if (pcWidth.matches) {
    headerJs.removeClass('open');
  }
}
pcWidth.addListener(checkBreakPoint);
checkBreakPoint();

};

window.addEventListener('turbolinks:load', load)