Template.allCell.first = ->
  Subjects.findOne(_id: @value.all.subject).Title
  # @value.all.subject

Template.allCell.second = ->
  if Session.equals "displayed_for", "lecturers"
    @value.all.groups
  else
    # @value.all.lecturer
    Lecturers.findOne(_id: @value.all.lecturer).Surname

Template.allCell.third = ->
  if Session.equals "displayed_for", "classrooms"
    @value.all.groups
  else
    # @value.all.classRoom
    Classrooms.findOne(_id: @value.all.classRoom).num

Template.topCell.first = ->
  Subjects.findOne(@value.top.subject).Title
  # @value.top.subject

Template.topCell.second = ->
  if Session.equals "displayed_for", "lecturers"
    @value.top.grous
  else
    # @value.top.lecturer
    Lecturers.findOne(_id: @value.top.lecturer).Surname

Template.topCell.third = ->
  if Session.equals "displayed_for", "classrooms"
    @value.top.groups
  else
    # @value.top.classRoom
    Classrooms.findOne(_id: @value.top.classRoom).num

Template.botCell.first = ->
  Subjects.findOne(@value.bot.subject).Title
  # Subjects.findOne(_id: @value.bot.subject).Title
  # @value.bot.subject

Template.botCell.second = ->
  if Session.equals "displayed_for", "lecturers"
    @value.bot.groups
  else
    # @value.bot.lecturer
    Lecturers.findOne(_id: @value.bot.lecturer).Surname

Template.botCell.third = ->
  if Session.equals "displayed_for", "classrooms"
    @value.bot.groups
  else
    # @value.bot.classRoom
    Classrooms.findOne(_id: @value.bot.classRoom).num
