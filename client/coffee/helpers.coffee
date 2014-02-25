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

