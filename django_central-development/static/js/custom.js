$(document).ready(function(){
  /* custom js */
    $("ul.show_list").each(function(){
        if ($(this).children('li').length == 0) {
            $(this).css('display', 'none');
        }
    });
});