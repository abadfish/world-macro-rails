$(document).ready(function(){
  $('#openTrades').DataTable();
});

$(document).ready(function() {
  var table = $('#openTrades').DataTable();

  $('#openTrades tbody').on('click', 'tr', function () {
    var data = table.row( this ).data();
    debugger
    
    $("#tradeModal").modal("show");
    } );
} );
