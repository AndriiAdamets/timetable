Template.allCell.first = ->
  # Subjects.findOne(_id: @value.all.subject).Title
  @value.all.subject

Template.allCell.second = ->
  if Session.equals "displayed_for", "lecturers"
    @value.all.groups
  else
    Lecturers.findOne(_id: @value.all.lecturer).Surname

Template.allCell.third = ->
  if Session.equals "displayed_for", "classrooms"
    @value.all.groups
  else
    Classrooms.findOne(_id: @value.all.classRoom).num
  
Template.topCell.first = ->
  # Subjects.findOne(_id: @value.top.subject).Title
  @value.top.subject

Template.topCell.second = ->
  if Session.equals "displayed_for", "lecturers"
    @value.top.grous
  else
    Lecturers.findOne(_id: @value.top.lecturer).Surname

Template.topCell.third = ->
  if Session.equals "displayed_for", "classrooms"
    @value.top.groups
  else
    Classrooms.findOne(_id: @value.top.classRoom).num

Template.botCell.first = ->
  # Subjects.findOne(_id: @value.bot.subject).Title
  @value.bot.subject

Template.botCell.second = ->
  if Session.equals "displayed_for", "lecturers"
    @value.bot.groups
  else
    Lecturers.findOne(_id: @value.bot.lecturer).Surname

Template.botCell.third = ->
  if Session.equals "displayed_for", "classrooms"
    @value.bot.groups
  else
    Classrooms.findOne(_id: @value.bot.classRoom).num