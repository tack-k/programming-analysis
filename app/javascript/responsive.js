
function load() {
  
  var height = window.innerHeight;
  document.documentElement.style.setProperty('--vh', height / 100 + 'px')

};

window.addEventListener('turbolinks:load', load)