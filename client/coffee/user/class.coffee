Template.allCell.first = ->
  Subjects.findOne(_id: @value.all.subject).Title

Template.allCell.second = ->
  if Session.equals "displayed_for", "lecturers"
    @value.all.groups
  else
    lecturer = Lecturers.findOne(_id: @value.all.lecturer)
    "#{lecturer.Surname} #{lecturer.Name[0]}. #{lecturer.Patronymic[0]}."

Template.allCell.third = ->
  if Session.equals "displayed_for", "classrooms"
    @value.all.groups
  else
    Classrooms.findOne(_id: @value.all.classRoom).num

Template.topCell.first = ->
  Subjects.findOne(@value.top.subject).Title

Template.topCell.second = ->
  if Session.equals "displayed_for", "lecturers"
    @value.top.grous
  else
    lecturer = Lecturers.findOne(_id: @value.top.lecturer)
    "#{lecturer.Surname} #{lecturer.Name[0]}. #{lecturer.Patronymic[0]}."

Template.topCell.third = ->
  if Session.equals "displayed_for", "classrooms"
    @value.top.groups
  else
    Classrooms.findOne(_id: @value.top.classRoom).num

Template.botCell.first = ->
  Subjects.findOne(@value.bot.subject).Title

Template.botCell.second = ->
  if Session.equals "displayed_for", "lecturers"
    @value.bot.groups
  else
    lecturer = Lecturers.findOne(_id: @value.bot.lecturer)
    "#{lecturer.Surname} #{lecturer.Name[0]}. #{lecturer.Patronymic[0]}."

Template.botCell.third = ->
  if Session.equals "displayed_for", "classrooms"
    @value.bot.groups
  else
    Classrooms.findOne(_id: @value.bot.classRoom).num
