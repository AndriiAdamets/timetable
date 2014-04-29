Template.editClassModal.rendered = ->
  data = Session.get 'edit_modal/class'
  Session.set 'edit_modal/selected_lecturer', data.lecturer
  Session.set 'edit_modal/selected_subject', data.subject
  Session.set 'edit_modal/selected_classroom', data.classroom


Template.editClassModal.classNo = ->
  Session.get('edit_modal/class').classNo

Template.editClassModal.classNo = ->
  Session.get('edit_modal/class').dayNo

Template.editClassModal.subject = ->
  data = Session.get 'edit_modal/class'
  selector = {}
  selector.dayNo = data.dayNo
  selector.classNo = data.classNo
  selector.classroom = data.classroom
  Timetable.findOne(selector).subject

Template.editClassModal.groups =->
  selector = {}
  data = Session.get 'edit_modal/class'
  selector.dayNo = data.dayNo
  selector.classNo = data.classNo
  selector.classroom = data.classroom
  groups = _.uniq(_(Timetable.find(selector).fetch()).pluck "group", false)
  Groups.find(groups)

# Template.editClassModal.lecturer = ->
#   Lecturers.find (Session.get.('edit_modal/class').lecturer)

Template.editClassModal.days = ->
  dayNums = _.uniq(_(Timetable.find().fetch()).pluck "dayNo", false)

Template.editClassModal.loadingDays = ->
  TimetableHandle and not TimetableHandle.ready()

Template.editClassModal.loadingGroups = ->
  GroupsHandle and not GroupsHandle.ready()

Template.editClassModal.loadngLecturers = ->
  LecturersHandle and not LecturersHandle.ready()

Template.editClassModal.loadingClassrooms =->
  ClassroomsHandle and not ClassroomsHandle.ready()

Template.editClassModal.currentLecturer = ->
  lect = Lecturers.findOne(Session.get 'edit_modal/selected_lecturer')
  console.log lect
  lect

Template.editClassModal.currentSubject = ->
  Lecturers.findOne(Session.get 'edit_modal/selected_subject')

Template.editClassModal.currentClassroom = ->
  Lecturers.findOne(Session.get 'edit_modal/selected_classroom')

Template.editClassModal.groups = ->
  Groups.find()

Template.editClassModal.lecturers = ->
  Lecturers.find()

Template.editClassModal.classrooms = ->
  Classrooms.find()

Template.editClassModal.active_group = ->
  active_groups = Session.get "active_groups"
  if active_groups isnt undefined and active_groups.indexOf(@_id) > -1 then "checked" else ""

Template.editClassModal.active_lecturer = ->
  active_lecturers = Session.get "active_lecturers"
  if active_lecturers isnt undefined and active_lecturers.indexOf(@_id) > -1 then "checked" else ""

Template.editClassModal.active_classroom = ->
  active_classrooms = Session.get "active_classrooms"
  if active_classrooms isnt undefined and active_classrooms.indexOf(@_id) > -1 then "checked" else ""
