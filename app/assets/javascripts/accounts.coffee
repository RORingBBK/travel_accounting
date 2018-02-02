$(document).ready ->
  table = $('#account-table').DataTable()
  $('.best_in_place').best_in_place()
  # debugger;
  tr = $('table#account-table tr:last').clone(true, true)


  tr.find('td.sorting_1').replaceWith("<td><b>Total</b></td>")
  tr.find('td div.ui-widget').replaceWith("")
  tr.find('td span.hell').replaceWith("")

  tr.find('td span.debit').addClass("total-debit")
  tr.find('td span.total-debit').removeClass("debit")

  tr.find('td span.credit').addClass("total-credit")
  tr.find('td span.total-credit').removeClass("credit")


  tr.find('td:last').replaceWith("<td><td>")

  debitTotal = 0
  $('.debit').each ->
    stval = parseFloat($(this).text())
    debitTotal += if isNaN(stval) then 0 else stval
    return
  tr.find('td span.total-debit').text(debitTotal.toFixed(2))

  creditTotal = 0
  $('.credit').each ->
    # debugger;
    stval = parseFloat($(this).text())
    creditTotal += if isNaN(stval) then 0 else stval
    return
  tr.find('td span.total-credit').text(creditTotal.toFixed(2))

  tr.show()
  $('table tbody').append(tr)

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
        $('#best_in_place_account_' + account_id + '_debit').text("-")

      #check if the credit value is a positive integer

      if /^\+?[1-9][\d]*$/.test(credit) == false
        $('#best_in_place_account_' + account_id + '_credit').text("-")

      total = debit + credit
      $('#' + account_id + '_total').text(total)
      tr = $('table#account-table tr:last')

      debitTotal = 0
      $('.debit').each ->
        stval = parseFloat($(this).text())
        debitTotal += if isNaN(stval) then 0 else stval
        return
      tr.find('td span.total-debit').text(debitTotal.toFixed(2))

      creditTotal = 0
      $('.credit').each ->
        stval = parseFloat($(this).text())
        creditTotal += if isNaN(stval) then 0 else stval
        return
      tr.find('td span.total-credit').text(creditTotal.toFixed(2))

  return

