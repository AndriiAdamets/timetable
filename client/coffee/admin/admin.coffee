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

Template.leftSideAdminMenu.rendered = ->
  items = $(".admin_leftside_menu_item")
  for item in items
    $(item).removeClass "active"
  $(items[0]).addClass "active"
  $("#admin_page_header").text $(".admin_leftside_menu_item.active a").text()
  Session.set "displayed_table", $(items[0]).attr "value"

Template.leftSideAdminMenu.events
  "click #logout" : ->
    Meteor.logout()

  "click .admin_leftside_menu_item": (e)->
    li = $(e.target).parent()
    items = $(".admin_leftside_menu_item")
    for item in items
      $(item).removeClass "active"
    $(li).addClass "active"
    Session.set "displayed_table", li.attr "value"
    $("#admin_page_header").text $(li).text()

Template.tablesContainer.edit_admin = ->
  Session.equals 'displayed_table', 'editAdmin'

Template.tablesContainer.display_groups = ->
  Session.equals "displayed_table", "groups"

Template.tablesContainer.display_lecturers = ->
  Session.equals "displayed_table", "lecturers"

Template.tablesContainer.display_classrooms = ->
  Session.equals "displayed_table", "classrooms"

Template.tablesContainer.display_subjects = ->
  Session.equals "displayed_table", "subjects"

Template.tablesContainer.display_timetable = ->
  Session.equals "displayed_table", "timetable"

Template.groupsTable.groups = ->
  Groups.find({}, {sort:{Title:1}})

Template.groupsTable.events
  "click .btn-danger": ->
    timetable = Timetable.find(group: @_id).fetch()
    for i in timetable
      Timetable.remove i._id
    Groups.remove @_id
  "click .btn-success": ->
    title = $('input[name="group_title"]').val()
    type = $('input[name="group_type"]').val()
    year = $('input[name="group_date"]').val()
    department = $('input[name="group_department"]').val()
    persons = $('input[name="group_persons"]').val()
    Groups.insert(
      Title: title
      Type: type
      Department: department
      Year: year
      Persons: persons
      )
    # Groups.update({_id:@_id}, {$set:{Title:cells[0].innerHTML}})
  "blur td": (e)->
    cells = $(e.target).parent().find "td"
    Groups.update({_id: @_id}, {$set:{Title: cells[0].innerHTML, Type: cells[1].innerHTML, Department: cells[3].innerHTML, Year: cells[2].innerHTML, Persons: cells[4].innerHTML}})


Template.lecturersTable.lecturers = ->
  Lecturers.find({}, sort:{Surname:1})

Template.lecturersTable.events
  "click .btn-danger": ->
    timetable = Timetable.find(lecturer: @_id).fetch()
    for i in timetable
      Timetable.remove i._id
    Lecturers.remove @_id
  "click .btn-success": ->
    surname = $('input[name="lecturer_surname"]').val()
    name = $('input[name="lecturer_name"]').val()
    patronymic = $('input[name="lecturer_patronymic"]').val()
    Lecturers.insert(Surname: surname, Name: name, Patronymic: patronymic)
  "blur td": (e)->
    cells = $(e.target).parent().find "td"
    Lecturers.update({_id: @_id}, {$set:{Surname: cells[0].innerHTML, Name: cells[1].innerHTML, Patronymic: cells[2].innerHTML}})


Template.subjectsTable.subjects = ->
  Subjects.find({}, sort:{Title:1})

Template.subjectsTable.events
  "click .btn-danger": ->
    timetable = Timetable.find(subject: @_id).fetch()
    for i in timetable
      Timetable.remove i._id
    Subjects.remove @_id
  "click .btn-success": ->
    title = $('input[name="subject_title"]').val()
    discription = $('input[name="subject_discription"]').val()
    Subjects.insert(Title: title, Discription: discription)
  "blur td": (e)->
    cells = $(e.target).parent().find "td"
    Subjects.update({_id: @_id}, {$set:{Title: cells[0].innerHTML, Desciption: cells[1].innerHTML}})


Template.classroomsTable.classrooms = ->
  Classrooms.find()

Template.classroomsTable.events
  "click .btn-danger": ->
    timetable = Timetable.find(classRoom: @_id).fetch()
    for i in timetable
      Timetable.remove i._id
    Classrooms.remove @_id
  "click .btn-success": ->
    num = $('input[name="classroom_num"]').val()
    roomines = $('input[name="classroom_roomines"]').val()
    Classrooms.insert(num: num, roomines: roomines)

  "blur td": (e)->
    cells = $(e.target).parent().find "td"
    Subjects.update({_id: @_id}, {$set:{Title: cells[0].innerHTML, Desciption: cells[1].innerHTML}})
