Template.adminAllCell.first = ->
  Subjects.findOne(@value.all.subject).Title

Template.adminAllCell.second = ->
  Lecturers.findOne(_id: @value.all.lecturer).Surname

Template.adminAllCell.third = ->
  @value.all.groups

Template.adminAllCell.events
  'click': (e) ->
    if $(e.target).hasClass('killAll') or $(e.target).hasClass('icon-trash')
      selector = {}
      selector.dayNo = @value.all.dayNo
      selector.classNo = @value.all.classNo
      selector.type = @value.all.type
      selector.classRoom = @value.all.classRoom
      Meteor.call 'removeLesson', selector
    else
      Session.set 'edit_modal/class', @value.all
      templateRender 'editClassModal'
      $('#editClassModal').modal 'show'

Template.adminAllCell.isntEmpty = ->
  typeof(@value.all._id) isnt undefined


Template.adminTopCell.first = ->
  Subjects.findOne(@value.top.subject).Title

Template.adminTopCell.second = ->
  Lecturers.findOne(_id: @value.top.lecturer).Surname

Template.adminTopCell.third = ->
  @value.top.groups

Template.adminTopCell.events
  'click': (e) ->
    if $(e.target).hasClass('killAll') or $(e.target).hasClass('icon-trash')
      selector = {}
      selector.dayNo = @value.top.dayNo
      selector.classNo = @value.top.classNo
      selector.type = @value.top.type
      selector.classRoom = @value.top.classRoom
      console.log 'Selector', selector
      Meteor.call 'removeLesson', selector
    else
      Session.set 'edit_modal/class', @value.top
      templateRender 'editClassModal'
      $('#editClassModal').modal 'show'

Template.adminTopCell.isntEmpty = ->
  typeof(@value.top._id) isnt undefined

Template.adminBotCell.first = ->
  Subjects.findOne(@value.bot.subject).Title

Template.adminBotCell.second = ->
  Lecturers.findOne(_id: @value.bot.lecturer).Surname

Template.adminBotCell.third = ->
  @value.bot.groups

Template.adminBotCell.events
  'click': (e) ->
    if $(e.target).hasClass('killAll') or $(e.target).hasClass('icon-trash')
      selector = {}
      # selector.dayNo = @value.bot.dayNo
      # selector.classNo = @value.bot.classNo
      selector.type = @value.bot.type
      # selector.classRoom = @value.bot.classRoom
      console.log 'Selector', selector
      Meteor.call 'removeLesson', selector
    else
      Session.set 'edit_modal/class', @value.bot
      templateRender 'editClassModal'
      $('#editClassModal').modal 'show'

Template.adminBotCell.isntEmpty = ->
  typeof(@value.bot._id) isnt undefined

Template.adminTopEmptyCell.events
  'click': (e) ->
    console.log @parent
    Session.set 'edit_modal/selected_type', 'top'

Template.adminClass.events
  'click': ->
    Session.set 'edit_modal/selected_dayNo', @value.dayNo
    Session.set 'edit_modal/selected_classNo', @value.classNo
    Session.set 'edit_modal/selected_classroom', @value.classRoom
    console.log 'ClassNo:', Session.get 'edit_modal/selected_classNo'
    templateRender 'editClassModal'
    $('#editClassModal').modal 'show'
