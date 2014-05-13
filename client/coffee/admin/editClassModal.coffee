Template.editClassModal.rendered = ->
  data = Session.get 'edit_modal/class'
  unless data
    data = {}
    data.lecturer = ''
    data.subject = ''
    data.type = 'all'
  groups = {}
  groups.classNo = Session.get 'edit_modal/selected_classNo'
  groups.dayNo = Session.get 'edit_modal/selected_dayNo'
  groups.type = data.type
  groups.classRoom = Session.get 'selected_classroom'
  groups = _.uniq(_(Timetable.find(groups).fetch()).pluck "group", false)
  Session.set 'edit_modal/selected_groups', groups
  Session.set 'edit_modal/selected_lecturer', data.lecturer
  Session.set 'edit_modal/selected_subject', data.subject
  # Session.set 'edit_modal/selected_classroom', data.classRoom
  Session.set 'edit_modal/selected_type', data.type
  Session.set 'edit_modal/selected_subject', data.subject
  rads = $('input[type="radio"')
  for i in rads
    if Session.equals 'edit_modal/selected_type',$(i).val()
      $(i).prop('checked', true)


Template.editClassModal.classNo = ->
  Session.get('edit_modal/class').classNo

Template.editClassModal.dayNo = ->
  Session.get('edit_modal/class').dayNo

Template.editClassModal.subject = ->
  # data = Session.get 'edit_modal/class'
  selector = {}
  selector.dayNo = Session.get 'edit_modal/selected_dayNo'
  selector.classNo = Session.get 'edit_modal/selected_classNo'
  selector.classroom = Session.get 'edit_modal/selected_classroom'
  Timetable.findOne(selector).subject

Template.editClassModal.groups =->
  # data = Session.get 'edit_modal/class'
  selector = {}
  selector.dayNo = Session.get 'edit_modal/selected_dayNo'
  selector.classNo = Session.get 'edit_modal/selected_classNo'
  selector.classroom = Session.get 'edit_modal/selected_classroom'
  groups = _.uniq(_(Timetable.find(selector).fetch()).pluck "group", false)
  Groups.find(groups)

Template.editClassModal.subjects = ->
  Subjects.find()

Template.editClassModal.days = ->
  dayNums = _.uniq(_(Timetable.find().fetch()).pluck "dayNo", false)

Template.editClassModal.loadingDays = ->
  TimetableHandle and not TimetableHandle.ready()

Template.editClassModal.loadingGroups = ->
  GroupsHandle and not GroupsHandle.ready()

Template.editClassModal.loadingSubjects = ->
  SubjectsHandle and not SubjectsHandle.ready()

Template.editClassModal.loadngLecturers = ->
  LecturersHandle and not LecturersHandle.ready()

Template.editClassModal.loadingClassrooms =->
  ClassroomsHandle and not ClassroomsHandle.ready()

Template.editClassModal.currentGroups = ->
  cur_groups = Session.get('edit_modal/selected_groups')
  console.log cur_groups.length
  cur_groups = [] if (typeof(cur_groups) is 'undefined')
  selector = {}
  selector._id = {$in: cur_groups} if (cur_groups and cur_groups.length > 0)
  cur_groups = Groups.find(selector) if cur_groups.length > 0
  cur_groups

Template.editClassModal.currentLecturer = ->
  Lecturers.findOne(Session.get 'edit_modal/selected_lecturer')

Template.editClassModal.currentSubject = ->
  Subjects.findOne(Session.get 'edit_modal/selected_subject')

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
  # if active_groups isnt undefined and active_groups.indexOf(@_id) > -1 then "checked" else ""

Template.editClassModal.active_lecturer = ->
  Session.get "edit_modal/selected_lecturer"
  # if active_lecturer isnt undefined and active_lecturer.indexOf(@_id) > -1 then "checked" else ""
Template.editClassModal.active_subject = ->
  Session.get 'edit_modal/selected_subject'

Template.editClassModal.active_classroom = ->
  active_classroom = Session.get 'edit_modal/selected_classroom'
  # if active_classroom isnt undefined and active_classroom.indexOf(@_id) > -1 then "checked" else ""

Template.editClassModal.active_type = ->
  active_type = Session.get 'edit_modal/selected_type'

Template.editClassModal.events
  'click input[type="radio"]' : (e) ->
    rads = $('input[type="radio"')
    for i in rads
      $(i).prop 'checked', false
    $(e.target).prop 'checked', true
    Session.set 'edit_modal/selected_type', $(e.target).val()

  'dblclick select option' : ->
    groups = Session.get 'edit_modal/selected_groups'
    groups.splice groups.indexOf(@_id), 1
    Session.set 'edit_modal/selected_groups', groups

  'click .dropdown-menu input': ->
    false

  'click .lecturerNavItem': ->
    Session.set 'edit_modal/selected_lecturer', @_id

  'click .subjectNavItem': ->
    Session.set 'edit_modal/selected_subject', @_id

  'click .classroomNavItem': ->
    Session.set 'edit_modal/selected_classroom', @_id

  'click .groupNavItem' : ->
    groups = Session.get 'edit_modal/selected_groups'
    groups = [] if typeof(groups) is 'undefined'
    groups.push @_id
    Session.set 'edit_modal/selected_groups', groups

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

  'click .btn-primary': ->
    selector = {}
    oldClass = Session.get 'edit_modal/class'
    selector.dayNo = Session.get 'edit_modal/selected_dayNo'
    selector.classNo = Session.get 'edit_modal/selected_classNo'
    selector.classRoom = Session.get 'edit_modal/selected_classroom'
    type = Session.get 'edit_modal/selected_type'
    if type isnt 'all' and ((typeof oldClass isnt 'undefined') and oldClass.type isnt 'all')
      selector.type =type
    Meteor.call 'removeLesson', selector
    selector.type = type
    selector.lecturer = Session.get 'edit_modal/selected_lecturer'
    selector.subject = Session.get 'edit_modal/selected_subject'
    groups = Session.get 'edit_modal/selected_groups'
    for i in groups
      console.log selector.type
      selector.group = i
      Timetable.insert selector
    $('#editClassModal').modal 'hide'

Template.editClassModal.classroomUndefined = ->
  Session.get 'undefinedClassroom'
