Template.mainNavbar.days = ->
  dayNums = _.uniq(_(Timetable.find().fetch()).pluck "dayNo", false)

Template.mainNavbar.loadingDays = ->
  TimetableHandle and not TimetableHandle.ready()

Template.mainNavbar.loadingGroups = ->
  GroupsHandle and not GroupsHandle.ready()

Template.mainNavbar.loadngLecturers = ->
  LecturersHandle and not LecturersHandle.ready()

Template.mainNavbar.Title = ->
  DaysOfWeek[@-1]

Template.mainNavbar.groups = ->
  Groups.find({}, {sort:{Title:1}})

Template.mainNavbar.lecturers = ->
  Lecturers.find()

Template.mainNavbar.classrooms = ->
  Classrooms.find()

Template.mainNavbar.activeDay = () ->
  (if Session.equals("selectedDayInSlideMenu", @.valueOf()) then "active" else "")

Template.mainNavbar.events
  'click .dropdown-menu input': ->
    false
  'keyup .dropdown-menu input':(e) ->
    search_val = ' '+$(e.target).val()
    search_val = search_val.toLowerCase()
    items = $(e.target).parent().parent().find('li')
    if search_val is " "
      for i in items
        $(i).show()
    else
      for i in items
        cur_text = ' '+$(i).find('a').text().toLowerCase().trim()
        console.log cur_text
        if cur_text.indexOf(search_val) >= 0
          $(i).show()
        else
          $(i).hide()
  'click li.dayNavItem': ->
    Session.set "selectedDayInSlideMenu", @.valueOf()
    $('html, body').animate
          scrollTop: $("#"+@).offset().top
      , 800

  'click li.groupNavItem': ->
    Session.set "displayedFor", "groups"
    Session.set "displayedGroup", @_id

  'click li.ecturerNavItem': ->
    Session.set "displayedForGroups", false
    Session.set "displayedLecturer", @_id

  'click #cb_showEmptyClasses': ->
    Session.set "showEmptyClasses", $('#cb_showEmptyClasses').is(":checked")
