Template.adminDayTimetable.displayedForGroups = ->
  Session.get "displayedForGroups"

Template.adminDayTimetable.dayTitle = ->
  DaysOfWeek[@.name-1]

Template.adminDayTimetable.allSubj = ->
  Subjects.findOne(_id : @.value.all.subject).Title

Template.adminDayTimetable.groupTitle = ->
  Groups.findOne(_id : @valueOf()).Title

Template.adminDayTimetable.allLect = ->
  lecturer = Lecturers.findOne(_id : @.value.all.lecturer)
  lecturer.Surname + " " + lecturer.Name[0] + ". " + lecturer.Patronymic[0]+"."

Template.adminDayTimetable.topSubj = ->
  Subjects.findOne(_id : @.value.top.subject).Title

Template.adminDayTimetable.topLect = ->
  # Lecturers.findOne(_id : @.value.top.lecturer).Surname
  lecturer = Lecturers.findOne(_id : @.value.top.lecturer)
  lecturer.Surname + " " + lecturer.Name[0] + ". " + lecturer.Patronymic[0]+"."

Template.adminDayTimetable.botSubj = ->
  Subjects.findOne(_id : @.value.bot.subject).Title

Template.adminDayTimetable.botLect = ->
  # Lecturers.findOne(_id : @.value.bot.lecturer).Surname
  lecturer = Lecturers.findOne(_id : @.value.bot.lecturer)
  lecturer.Surname + " " + lecturer.Name[0] + ". " + lecturer.Patronymic[0]+"."

Template.adminDayTimetable.classesCount = ->
  _.keys(@.value).length+1

Template.adminDayTimetable.doubleClassesCount = ->
  (_.keys(@.value).length)*3+1
