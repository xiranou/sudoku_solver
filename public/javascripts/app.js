$(function () {
  $('body').on('submit', 'form.board', function(e) {
    e.preventDefault();
    var $form = $(e.target);
    var url = $form.attr('action');
    var data = $form.find("input[class='number-input']").map(function(index, elem) {
      var val = $(elem).val();
      if (val) {
        return val;
      } else {
        return "0";
      }
    }).get().join("");

    $.ajax({
      url: url,
      type: 'POST',
      dataType: 'JSON',
      data: {data: data},
    })
    .done(function(data) {
      console.log(data);
    })
    .fail(function() {
      console.log("error");
    });

  });
});