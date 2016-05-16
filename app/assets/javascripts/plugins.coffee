$ ->
  $('[data-toggle="popover"]').popover
    trigger: 'click'
    html: true
    placement: 'bottom'
  return

  $('[data-toggle="tooltip"]').tooltip
    trigger: 'hover'
  return
