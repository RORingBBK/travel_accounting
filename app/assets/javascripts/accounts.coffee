$(document).ready ->
  $('#account-table').dataTable
    'pageLength': 25
  $('.best_in_place').best_in_place()

  return 