Template.editClassModal.rendered = ->
  data = Session.get 'edit_modal/class'
  groups = {}
  groups.classNo = data.classNo
  groups.dayNo = data.dayNo
  groups.type = data.type
  groups.classRoom = data.classRoom
  groups = _.uniq(_(Timetable.find(groups).fetch()).pluck "group", false)
  Session.set 'edit_modal/selected_groups', groups
  Session.set 'edit_modal/selected_lecturer', data.lecturer
  Session.set 'edit_modal/selected_subject', data.subject
  Session.set 'edit_modal/selected_classroom', data.classRoom
  Session.set 'edit_modal/selected_type', data.type
  rads = $('input[type="radio"')
  for i in rads
    if Session.equals 'edit_modal/selected_type',$(i).val()
      $(i).prop('checked', true)
  # groups = Timetable.find({})


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

Template.editClassModal.currentGroups = ->
  cur_groups = Session.get('edit_modal/selected_groups')
  selector = {}
  selector._id = {$in: cur_groups} if (cur_groups and cur_groups.length > 0)
  cur_groups = Groups.find(selector)

Template.editClassModal.currentLecturer = ->
  Lecturers.findOne(Session.get 'edit_modal/selected_lecturer')

Template.editClassModal.currentSubject = ->
  Lecturers.findOne(Session.get 'edit_modal/selected_subject')

Template.editClassModal.currentClassroom = ->
  Classrooms.findOne(Session.get 'edit_modal/selected_classroom')

Template.editClassModal.current_type = ->
  Session.get 'edit_modal/selected_type'

Template.editClassModal.groups = ->
  Groups.find()

Template.editClassModal.lecturers = ->
  Lecturers.find()

Template.editClassModal.classrooms = ->
  Classrooms.find()

Template.editClassModal.active_group = ->
  active_groups = Session.get "edit_modal/selected_groups"
  if active_groups isnt undefined and active_groups.indexOf(@_id) > -1 then "checked" else ""

Template.editClassModal.active_lecturer = ->
  active_lecturer = Session.get "edit_modal/selected_lecturer"
  if active_lecturer isnt undefined and active_lecturer.indexOf(@_id) > -1 then "checked" else ""

Template.editClassModal.active_classroom = ->
  active_classroom = Session.get 'edit_modal/selected_classroom'
  if active_classroom isnt undefined and active_classroom.indexOf(@_id) > -1 then "checked" else ""

Template.editClassModal.active_type = ->
  active_type = Session.get 'edit_modal/selected_type'

Template.editClassModal.events
  'click input[type="radio"]' : (e) ->
    rads = $('input[type="radio"')
    for i in rads
      $(i).prop 'checked', false
    $(e.target).prop 'checked', true
    Session.set 'edit_modal/selected_type', $(e.target).val()
    console.log Session.get('edit_modal/selected_type')
