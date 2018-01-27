$(document).ready ->
  table = $('#account-table').DataTable()
  $('.best_in_place').best_in_place()

  $('#account-table tbody tr td').keypress (e) ->

    account_id = ($(this).find('span:first').attr('id')).split('_')[4]
    # account_cell_name = ($(this).find('span:first').attr('id')).split('_')[5]

    if e.which == 13
    
      next_id = $(this).closest('td').next('td').find('span:first').attr('id')
      $('#' + next_id).click()
      debit = parseInt($('#best_in_place_account_' + account_id + '_debit').text() || $('#best_in_place_account_' + account_id + '_debit')[0].dataset.bipOriginalContent)
      # $('#best_in_place_account_' + account_id + '_debit').text(debit.toFixed(2))
      credit = parseInt($('#best_in_place_account_' + account_id + '_credit').text() || $(this).find('span:first').attr("data-bip-original-content"))

      #check if the debit value is a positive integer 

      if /^\+?[1-9][\d]*$/.test(debit) == false
        $('#best_in_place_account_' + account_id + '_debit').text("0.00")

      #check if the credit value is a positive integer 
      
      if /^\+?[1-9][\d]*$/.test(credit) == false
        $('#best_in_place_account_' + account_id + '_credit').text("0.00")
        
      total = debit + credit
      $('#' + account_id + '_total').text(total)
    return
  return 

