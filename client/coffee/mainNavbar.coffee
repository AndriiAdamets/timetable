Template.mainNavbar.days = ->
  dayNums = _.uniq(_(Timetable.find().fetch()).pluck "dayNo", false)

Template.mainNavbar.loadingDays = ->
  TimetableHandle and not TimetableHandle.ready()

Template.mainNavbar.loadingGroups = ->
  GroupsHandle and not GroupsHandle.ready()

Template.mainNavbar.loadngLecturers = ->
  LecturersHandle and not LecturersHandle.ready()

Template.mainNavbar.loadingClassrooms =->
  ClassroomsHandle and not ClassroomsHandle.ready()

Template.mainNavbar.Title = ->
  DaysOfWeek[@-1]

Template.mainNavbar.groups = ->
  Groups.find({}, {sort:{Title:1}})

Template.mainNavbar.lecturers = ->
  Lecturers.find()

Template.mainNavbar.classrooms = ->
  Classrooms.find()

Template.mainNavbar.activeDay = ->
  if Session.equals("selectedDayInSlideMenu", @.valueOf()) then "active" else ""


Template.mainNavbar.active_all_groups = ->
  active_groups = Session.get "active_groups"
  if active_groups is undefined or active_groups.length is 0
    "checked"
  else
    ""

Template.mainNavbar.active_all_lecturers = ->
  active_lecturers = Session.get "active_lecturers"
  if active_lecturers is undefined or active_lecturers.length is 0
    "checked"
  else
    ""

Template.mainNavbar.active_all_classrooms = ->
  active_classrooms = Session.get "active_classrooms"
  if active_classrooms is undefined or active_classrooms.length is 0
    "checked"
  else
    ""

Template.mainNavbar.active_group = ->
  active_groups = Session.get "active_groups"
  if active_groups isnt undefined and active_groups.indexOf(@_id) > -1 then "checked" else ""

Template.mainNavbar.active_lecturer = ->
  active_lecturers = Session.get "active_lecturers"
  if active_lecturers isnt undefined and active_lecturers.indexOf(@_id) > -1 then "checked" else ""

Template.mainNavbar.active_classroom = ->
  active_classrooms = Session.get "active_classrooms"
  if active_classrooms isnt undefined and active_classrooms.indexOf(@_id) > -1 then "checked" else ""


Template.mainNavbar.events
  'click .dropdown-menu input': ->
    false

  'keyup .dropdown-menu input':(e) ->
    search_val = ' '+$(e.target).val()
    search_val = search_val.toLowerCase()
    items = $(e.target).parent().parent().find('li')
    for i in items
      cur_text = ' '+$(i).find('a').text().toLowerCase().trim()
      if cur_text.indexOf(search_val) >= 0
        $(i).show()
      else
        $(i).hide()

  'click li.dayNavItem': ->
    Session.set "selectedDayInSlideMenu", @.valueOf()
    $('html, body').animate
          scrollTop: $("#"+@).offset().top - $($('.navbar')[0]).height()
      , 800

  'click li.groupNavItem': ->
    console.log @
    checkSessionArray "active_groups", @_id

  'click li.lecturerNavItem': ->
    checkSessionArray "active_lecturers", @_id

  'click li.classroomNavItem': ->
    checkSessionArray "active_classrooms", @_id

  'click li.displayNavItem': (e)->
    items = $('.displayNavItem')
    for i in items
      $(i).removeClass "active"
      $($(e.target).parent()).addClass "active"
    Session.set "displayed_for", $($(e.target).parent()).attr('value')

  'click #cb_showEmptyClasses': ->
    Session.set "showEmptyClasses", $('#cb_showEmptyClasses').is(":checked")
