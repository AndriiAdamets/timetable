Template.editClassModal.rendered = ->
  data = Session.get 'edit_modal/class'
  console.log 'data:', data

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

Template.editClassModal.dayTitle = ->
  DaysOfWeek[@-1]

Template.editClassModal.groups = ->
  Groups.find()

Template.editClassModal.lecturers = ->
  Lecturers.find()

Template.editClassModal.classrooms = ->
  Classrooms.find()
