document.addEventListener("turbolinks:load", function() {
  $(".category-link").hover(function() {
  $("ul.category1").toggle();
  });
  $(".category-link li ul").hide();
  $(".category-link li").hover(function() {
      $(">ul:not(:animated)", this).stop(true, true).slideDown();
      $(">a", this).addClass("active");
  }, function() {
      $(">ul:not(:animated)", this).stop(true, true).slideUp();
      $(">a", this).removeClass("active");
  });
});