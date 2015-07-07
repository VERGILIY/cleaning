$ ->
  if $('#sortable').length > 0
    $('#sortable').sortable
      axis: 'y'
      items: '.item'
      cursor: 'move'

      stop: (e, ui) ->
        ui.item.children('td').effect('highlight', {}, 1000)
      update: (e, ui) ->
        item_id = ui.item.data('item-id')
        position = ui.item.index()
        $.ajax
          type: 'POST'
          url: '/admin/slides/update_position'
          dataType: 'json'
          data: { id: item_id, slide: { position: position } }
