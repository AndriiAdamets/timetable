Template.mainTable.data = ->
  if Session.equals "displayed_for", "groups"
    return display_for_groups()
  if Session.equals "displayed_for", "lecturers"
    return display_for_lecturers()
  if Session.equals "displayed_for", "classrooms"
    return display_for_classrooms()

Template.mainTable.loading = ->
  TimetableHandle and not TimetableHandle.ready()

Template.mainTable.headCells = ->
  selector = {}
  if Session.equals "displayed_for", "groups"
    active_groups = Session.get "active_groups"
    if (active_groups and active_groups.length > 0)
      selector._id = {$in: active_groups}
    return _(Groups.find(selector, {sort:{Title:1}}).fetch()).pluck "Title"
  else if Session.equals "displayed_for", "lecturers"
    active_lecturers = Session.get "active_lecturers"
    selector._id = {$in: active_lecturers} if (active_lecturers and active_lecturers.length > 0)
    return _(Lecturers.find(selector, {sort:{Surname:1}}).fetch()).pluck "Surname"
  else if Session.equals "displayed_for", "classrooms"
    active_classrooms = Session.get "active_classrooms"
    if (active_classrooms and active_classrooms.length > 0)
      selector._id = {$in: active_classrooms}
    return _(Classrooms.find(selector, {sort:{num:1}}).fetch()).pluck "num"




Template.mainTable.Lecturers = ->
  displayedLecturerId = Session.get "displayedLecturer"
  if Session.equals "displayedLecturer", undefined
    classes = Timetable.find().collection.docs
    lctrs = {}
    for k,c of classes
      for l in ["bot", "top", "all"]
        lctrs[c.classes[l].lecturer] = 1 if c.classes[l]
    lctrs = _.keys(lctrs)
  else
    Lecturers.find(_id: displayedLecturerId)

Template.mainTable.lectName = ->
  if @_id is undefined
    lecturer = Lecturers.findOne(_id:@.toString())
    lecturer.Surname+" "+lecturer.Name[0]+". "+ lecturer.Patronymic[0]+"."
  else
    @.Surname+" "+@Name[0]+". "+ @Patronymic[0]+"."

Template.mainTable.loadingGroups = ->
  GroupsHandle and not GroupsHandle.ready()

Template.mainTable.displayedForGroups = ->
  Session.get "displayedForGroups"

Template.mainTable.loadngLecturers = ->
  LecturersHandle and not LecturersHandle.ready()

Template.mainTable.loadingSubjects = ->
  SubjectsHandle and not SubjectsHandle.ready()

Template.mainTable.studyDays = ->
  display_for_groups()
