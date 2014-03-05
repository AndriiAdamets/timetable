Template.allCell.first = ->
  Subjects.findOne(_id: @value.all.subject).Title

Template.allCell.second = ->
  if Session.equals "displayed_for", "lecturers"
    Groups.findOne(_id: @value.all.group).Title
  else
    Lecturers.findOne(_id: @value.all.lecturer).Surname

Template.allCell.third = ->
  if Session.equals "displayed_for", "classrooms"
    Groups.findOne(_id: @value.all.group).Title
  else
    Classrooms.findOne(_id: @value.all.classRoom).num
  
Template.topCell.first = ->
  Subjects.findOne(_id: @value.top.subject).Title

Template.topCell.second = ->
  if Session.equals "displayed_for", "lecturers"
    Groups.findOne(_id: @value.top.group).Title
  else
    Lecturers.findOne(_id: @value.top.lecturer).Surname

Template.topCell.third = ->
  if Session.equals "displayed_for", "classrooms"
    Groups.findOne(_id: @value.top.group).Title
  else
    Classrooms.findOne(_id: @value.top.classRoom).num

Template.botCell.first = ->
  Subjects.findOne(_id: @value.bot.subject).Title

Template.botCell.second = ->
  if Session.equals "displayed_for", "lecturers"
    Groups.findOne(_id: @value.bot.group).Title
  else
    Lecturers.findOne(_id: @value.bot.lecturer).Surname

Template.botCell.third = ->
  if Session.equals "displayed_for", "classrooms"
    Groups.findOne(_id: @value.bot.group).Title
  else
    Classrooms.findOne(_id: @value.bot.classRoom).num