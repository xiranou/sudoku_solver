$(function () {
  var $body = $('body'),
      $form = $body.find('form.board').first(),
      $inputs = $form.find("input[class='number-input']");

  $body
    .on('submit', 'form.board', submitToSolve)
    .on('click', '#x-reset-btn', clearInputs);

  function submitToSolve (e){
    e.preventDefault();
    e.stopImmediatePropagation();

    var url = $form.attr('action');
    var data = $inputs.map(function(index, elem) {
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
      data: {inputs: data}
      // below are test data:
      // data: {inputs: "096040001100060004504810390007950043030080000405023018010630059059070830003590007"}
    })
    .done(function(results) {
      appendResults(results);
    })
    .fail(function() {
      console.log("error");
    });
  }

  function appendResults (results) {
    var inputs = $inputs.map(function(index, elem) {
      return elem
    }).get();
    for (var i=0; i<results.length; i++){
      $(inputs[i]).val(results[i]);
    }
  }

  function clearInputs (e) {
    e.preventDefault();
    e.stopImmediatePropagation();
    $inputs.val('');
  }


});