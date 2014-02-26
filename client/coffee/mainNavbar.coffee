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

# Template.mainNavbar.activeGroup = ->
#   active_groups = Session.get "activeGroups"
#   return if activeGroup is undefined
#   cur_id = @_id
#   if $(activeGroups).indexOf(cur_text) > 0 then "checked" else ""
  # if (Session.get("activeGroups").pos(@.valueOf()).trim()) > 0 then "checked" else ""


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
    checkSessionArray "active_groups", @_id

  'click li.lecturerNavItem': ->
    checkSessionArray "active_lecturers", @_id

  'click li.classroomNavItem': ->
    checkSessionArray "active_classrooms", @_id


  'click #cb_showEmptyClasses': ->
    Session.set "showEmptyClasses", $('#cb_showEmptyClasses').is(":checked")
