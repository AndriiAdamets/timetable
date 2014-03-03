Template.dayTimetable.displayedForGroups = ->
  Session.get "displayedForGroups"

Template.dayTimetable.dayTitle = ->
  DaysOfWeek[@.name-1]

Template.dayTimetable.allSubj = ->
  Subjects.findOne(_id : @.value.all.subject).Title

Template.dayTimetable.groupTitle = ->
  Groups.findOne(_id : @valueOf()).Title

Template.dayTimetable.allLect = ->
  lecturer = Lecturers.findOne(_id : @.value.all.lecturer)
  lecturer.Surname + " " + lecturer.Name[0] + ". " + lecturer.Patronymic[0]+"."

Template.dayTimetable.topSubj = ->
  Subjects.findOne(_id : @.value.top.subject).Title

Template.dayTimetable.topLect = ->
  # Lecturers.findOne(_id : @.value.top.lecturer).Surname
  lecturer = Lecturers.findOne(_id : @.value.top.lecturer)
  lecturer.Surname + " " + lecturer.Name[0] + ". " + lecturer.Patronymic[0]+"."

Template.dayTimetable.botSubj = ->
  Subjects.findOne(_id : @.value.bot.subject).Title

Template.dayTimetable.botLect = ->
  # Lecturers.findOne(_id : @.value.bot.lecturer).Surname
  lecturer = Lecturers.findOne(_id : @.value.bot.lecturer)
  lecturer.Surname + " " + lecturer.Name[0] + ". " + lecturer.Patronymic[0]+"."



Template.dayTimetable.classesCount = ->
  _.keys(@.value).length+1

Template.dayTimetable.doubleClassesCount = ->
  (_.keys(@.value).length)*3+1
