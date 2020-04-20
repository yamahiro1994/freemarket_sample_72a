$(function(){

  $('#checkAll-status').on('click', function() {
    $('input[name="q[status_id_in][]"]').prop('checked', $(this).is(':checked') );
  });
  $('input[name="q[status_id_in][]"]').on( 'click', function() {
    let boxCount = $('input[name="q[status_id_in][]"]').length;
    let checked  = $('input[name="q[status_id_in][]"]' + ':checked' ).length;
    if( checked === boxCount ) {
      $('#checkAll-status').prop( 'checked', true );
    } else {
      $('#checkAll-status').prop( 'checked', false );
    }
  });

  $('#checkAll-delivery_charge').on('click', function() {
    $('input[name="q[delivery_charge_id_in][]"]').prop('checked', $(this).is(':checked') );
  });
  $('input[name="q[delivery_charge_id_in][]"]').on( 'click', function() {
    let boxCount = $('input[name="q[delivery_charge_id_in][]"]').length;
    let checked  = $('input[name="q[delivery_charge_id_in][]"]' + ':checked' ).length;
    if( checked === boxCount ) {
      $('#checkAll-delivery_charge').prop( 'checked', true );
    } else {
      $('#checkAll-delivery_charge').prop( 'checked', false );
    }
  });
});