Template.adminAllCell.first = ->
  @value.all.subject

Template.adminAllCell.second = ->
  if Session.equals "displayed_for", "lecturers"
    @value.all.groups
  else
    Lecturers.findOne(_id: @value.all.lecturer).Surname

Template.adminAllCell.third = ->
  if Session.equals "displayed_for", "classrooms"
    @value.all.groups
  else
    Classrooms.findOne(_id: @value.all.classRoom).num

Template.adminAllCell.events
  'click a.killAll': ->
    console.log 'id:', @value.all._id
    console.log 'value:', @value
    Timetable.remove @value.all._id

Template.adminTopCell.first = ->
  @value.top.subject

Template.adminTopCell.second = ->
  if Session.equals "displayed_for", "lecturers"
    @value.top.grous
  else
    Lecturers.findOne(_id: @value.top.lecturer).Surname

Template.adminTopCell.third = ->
  if Session.equals "displayed_for", "classrooms"
    @value.top.groups
  else
    Classrooms.findOne(_id: @value.top.classRoom).num

Template.adminBotCell.first = ->
  @value.bot.subject

Template.adminBotCell.second = ->
  if Session.equals "displayed_for", "lecturers"
    @value.bot.groups
  else
    Lecturers.findOne(_id: @value.bot.lecturer).Surname

Template.adminBotCell.third = ->
  if Session.equals "displayed_for", "classrooms"
    @value.bot.groups
  else
    Classrooms.findOne(_id: @value.bot.classRoom).num
