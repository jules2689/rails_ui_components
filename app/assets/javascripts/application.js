// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function handleCopySuccess(button) {
  var originalText = button.text();
  button.text("Success!");
  button.addClass("btn-success");
  setTimeout(function(){ 
   button.text(originalText);
   button.removeClass("btn-success");
  }, 500); 
}

function copyElementContents(elementToCopy, button) {
  var range = document.createRange();  
  range.selectNode(elementToCopy);  
  window.getSelection().addRange(range);  

  try {  
    document.execCommand('copy');  
    handleCopySuccess(button);
  } catch(err) {  
    alert('Unable to copy the text, please manually select it.');  
  }  

  window.getSelection().removeAllRanges(); 
}

$(document).on('ready page:load', function() {
  $('button.copyButton').on('click', function(event){
    var target = $(this).data("target");
    var elementToCopy = document.getElementById(target);  
    copyElementContents(elementToCopy, $(this));
  });
});
