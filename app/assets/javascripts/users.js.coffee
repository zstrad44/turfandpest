namespace "Turfandpest.Users", (exports) ->
  exports.initIndex = ->
    Turfandpest.Layout.initSearchField()
  
  exports.initForm = ->
    $("#ajax-modal select").select2()
    Turfandpest.Layout.initDateTimePicker()

