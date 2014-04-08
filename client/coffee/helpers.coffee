Handlebars.registerHelper('arrayify', (obj)->
  result = []
  for key of obj
    result.push({name:key,value:obj[key]})
  result
  )

Handlebars.registerHelper('ifAll', (key, options) ->
  if(key.type is "all" and key isnt undefined)
    options.fn @
  options.inverse @
)

Handlebars.registerHelper('ifTop', (key, options) ->
  if(key.type is "top" and key isnt undefined)
    options.fn @
  options.inverse @
)

Handlebars.registerHelper('ifBot', (key, options) ->
  if(key.type is "bot" and key isnt undefined)
    options.fn @
  options.inverse @
)

Handlebars.registerHelper('ifNotBot', (key, options) ->
  if(key.type is "bot" and key isnt undefined)
    options.inverse @
  options.fn @
)

Handlebars.registerHelper('hasAll', (key)->
  return true if key['all']._id isnt undefined
  false
  )

Handlebars.registerHelper('hasntAll', (key)->
  return true if key['all']._id is undefined
  false
  )

Handlebars.registerHelper('hasTop', (key)->
  return true if key['top']._id isnt undefined
  false
  )

Handlebars.registerHelper('hasBot', (key)->
  return true if key['bot']._id isnt undefined
  false
  )

window.templateRender = (templateName)->
  $ ->
    UI.insert(UI.render(Template[templateName]), document.body)
    # fragment = Meteor.render(->
    #   Template[templateName]() # @ calls the template and returns the HTML.
    # )
    # $("body").html fragment

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
