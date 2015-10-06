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

    var inputs = $form.find("input[class='number-input']").map(function(index, elem) {
      return elem
    }).get();


    $.ajax({
      url: url,
      type: 'POST',
      dataType: 'JSON',
      data: {data: data}
    })
    .done(function(results) {
      console.log(results);
      for (var i=0; i<81; i++){
        $(inputs[i]).val(results[i]);
      }
    })
    .fail(function() {
      console.log("error");
    });

  });
});