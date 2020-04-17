document.addEventListener("turbolinks:load", function() {
  $('.category-link').hover(function(){
    $(this).addClass('active');
    var parent__list = $('.active').children('.category1');
    parent__list.show();
  },function(){
    $(this).removeClass('active');
    $(this).children('.category1').hide();
  });

  $('.parent__list').hover(function(){
    $(this).addClass('active');
    var child__list = $('.active').children('.category2');
    child__list.show();
  },function(){
    $(this).removeClass('active');
    $(this).children('.category2').hide();
  });

  $('.child__list').hover(function(){
    $(this).addClass('active');
    var grandChild__list = $('.active').children('.category3');
    grandChild__list.show();
  },function(){
    $(this).removeClass('active');
    $(this).children('.category3').hide();

  });
});
