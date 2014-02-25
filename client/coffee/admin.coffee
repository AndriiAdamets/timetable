Template.loginForm.events
  "submit .form-signin": (e,t)->
    e.preventDefault()
    login = t.find("#login").value
    password = t.find("#password").value
    Meteor.loginWithPassword login, password, (err)->
      if err
        $("#signinError").show(200)
      else
        $("#signinError").hide()
    return false

Template.leftSideAdminMenu.events
  "click #logout" : ->
    Meteor.logout()

Template.groupsTable.events
  "click .btn-danger": ->
    timetable = Timetable.find(group: @_id).fetch()
    for i in timetable
      Timetable.remove i._id
    Groups.remove @_id
Template.groupsTable.groups = ->
  Groups.find({}, {sort:{Title:1}})

Template.lecturersTable.events
  "click .btn-danger": ->
    timetable = Timetable.find().fetch()
    for i in timetable
      for j in ["all", "top", "bot"]
        if i.classes[j]
          Timetable.remove i._id if i.classes[j].lecturer is @_id
    Lecturers.remove @_id

Template.lecturersTable.lecturers = ->
  Lecturers.find({}, sort:{Surname:1})

Template.subjectsTable.events
  "click .btn-danger": ->
    timetable = Timetable.find().fetch()
    for i in timetable
      for j in ["all", "top", "bot"]
        if i.classes[j]
          Timetable.remove i._id if i.classes[j].subject is @_id
    Subjects.remove @_id

Template.subjectsTable.subjects = ->
  Subjects.find({}, sort:{Title:1})
