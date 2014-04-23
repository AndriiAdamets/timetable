Template.adminAllCell.first = ->
  @value.all.subject

Template.adminAllCell.second = ->
  Lecturers.findOne(_id: @value.all.lecturer).Surname

Template.adminAllCell.third = ->
  @value.all.groups

Template.adminAllCell.events
  'click a.killAll': ->
    console.log 'Object:', @
    Meteor.call "removeLesson", @value.all.dayNo, @value.all.classNo, @value.all.type, @value.all.classroom

Template.adminTopCell.first = ->
  @value.top.subject

Template.adminTopCell.second = ->
  Lecturers.findOne(_id: @value.top.lecturer).Surname

Template.adminTopCell.third = ->
  @value.top.groups

Template.adminBotCell.first = ->
  @value.bot.subject

Template.adminBotCell.second = ->
  Lecturers.findOne(_id: @value.bot.lecturer).Surname

Template.adminBotCell.third = ->
  @value.bot.groups
