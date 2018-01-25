$(document).ready ->
  table = $('#account-table').DataTable()
  $('.best_in_place').best_in_place()

  $('#account-table tbody td').keypress (e) ->
    if e.which == 13
      next_id = $(this).closest('td').next('td').find('span:first').attr('id')
      $('#' + next_id).click()
    return
  return 