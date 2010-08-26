// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
  $('.rmv-dft-val').click(
    function() {
      if (this.value == this.defaultValue) {
        this.value = '';
      }
    }
  );
  
  $('.rmv-dft-val').blur(
    function() {
      if (this.value == '') {
        this.value = this.defaultValue;
      }
    }
  );
});