Handlebars.registerHelper('arrayify', (obj)->
  result = []
  for key of obj
    result.push({name:key,value:obj[key]})
  result
  )


window.templateRender = (templateName)->
  $ ->
    fragment = Meteor.render(->
      Template[templateName]() # this calls the template and returns the HTML.
    )
    $("body").html fragment

window.checkSessionArray = (array_name, item)->
  arr = Session.get array_name
  if arr is undefined
    arr = []
  if item is undefined
    arr = []
  else
    item_pos = arr.indexOf item
    if item_pos >= 0
      arr.splice item_pos, 1
    else
      arr.push item
  Session.set array_name, arr

# active_groups = Session.get "active_groups"
#     if active_groups is undefined
#       active_groups = []
#     if @_id is undefined
#       active_groups = []
#     else
#       group_pos = active_groups.indexOf @_id
#       if group_pos >= 0
#         active_groups.splice group_pos, 1
#       else
#         active_groups.push @_id
#     console.log "active_groups:", active_groups
#     Session.set "active_groups", active_groups

