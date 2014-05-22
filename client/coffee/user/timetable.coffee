window.DaysOfWeek = ["Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота"]

window.Lecturers = new Meteor.Collection "lecturers"
window.Timetable = new Meteor.Collection "timetable"
window.Subjects = new Meteor.Collection "subjects"
window.Groups = new Meteor.Collection "groups"
window.Classrooms = new Meteor.Collection "classrooms"
window.UpdateDate = new Meteor.Collection 'updatedate'

window.TimetableHandle = Meteor.subscribe "timetable"
window.LecturersHandle = Meteor.subscribe "lecturers"
window.SubjectsHandle = Meteor.subscribe "subjects"
window.GroupsHandle = Meteor.subscribe "groups"
window.ClassroomsHandle = Meteor.subscribe "classrooms"
window.UpdateDateHandle = Meteor.subscribe 'updatedate'

Meteor.startup ->
  Session.set "displayed_for", "groups"
  Session.set "displayedGroup", undefined
  Session.set "displayedLecturer", undefined
  Session.set "displayedForGroups", true
  Session.set "showEmptyClasses", true
  $('#cb_showEmptyClasses').prop("checked", true)

Template.mainTemplate.dateLoading = ->
  UpdateDateHandle and not UpdateDateHandle.ready()

Template.mainTemplate.timetableUpdated = ->
  date = UpdateDate.find().fetch()[0].updatedDate
  "#{date.getDate()}.#{('0' + (date.getMonth() + 1)).slice(-2)}.#{date.getFullYear()}"


Template.leftSideMenu.days = ->
  dayNums = _.uniq(_(Timetable.find().fetch()).pluck "dayNo", false)

Template.leftSideMenu.loadingDays = ->
  TimetableHandle and not TimetableHandle.ready()

Template.leftSideMenu.loadingGroups = ->
  GroupsHandle and not GroupsHandle.ready()

Template.leftSideMenu.loadngLecturers = ->
  LecturersHandle and not LecturersHandle.ready()

Template.leftSideMenu.title = ->
  DaysOfWeek[@-1]

Template.leftSideMenu.groups = ->
  Groups.find({}, {sort:{Title:1}})


Template.leftSideMenu.lecturers = ->
  Lecturers.find()

Template.leftSideMenu.activeDay = () ->
  (if Session.equals("selectedDayInSlideMenu", @.valueOf()) then "active" else "")

Template.leftSideMenu.events
  'click li.dayOfWeek': ->
    Session.set "selectedDayInSlideMenu", @.valueOf()
    $('html, body').animate
          scrollTop: $("#"+@).offset().top
      , 800

  'click li.displayedGroup': ->
    Session.set "displayedForGroups", true
    Session.set "displayedGroup", @_id

  'click li.displayedLecturer': ->
    Session.set "displayedForGroups", false
    Session.set "displayedLecturer", @_id

  'click #cb_showEmptyClasses': ->
    Session.set "showEmptyClasses", $('#cb_showEmptyClasses').is(":checked")
