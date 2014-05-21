Template.EditProfile.rendered = ->
  Session.set 'username', Meteor.user().username
  Session.set 'email_address', Meteor.user().emails[0].address
  Session.set 'email_verified', Meteor.user().emails[0].verified
  Session.set 'password_input_changed', false
  Session.set 'email_input_changed', false
  Session.set 'username_input_changed', false

Template.EditProfile.username = ->
  Session.get 'username'

Template.EditProfile.usernameChanged = ->
  Session.get 'username_input_changed'

Template.EditProfile.email = ->
  Session.get 'email_address'

Template.EditProfile.inputEmailChanged = ->
  Session.get 'email_input_changed'

Template.EditProfile.inputPasswordChanged = ->
  Session.get 'password_input_changed'


Template.EditProfile.mailNotVerified = ->
  (Session.equals 'email_verified', false) and (Session.equals 'email_input_changed', false)

Template.EditProfile.events
  'keyup input[name="userpass"]': ->
    Session.set 'password_input_changed', true
  'keyup input[name="username"]': ->
    Session.set 'username_input_changed', !(Meteor.user().username == $('input[name="username"]').val())
  'keyup input[name="email"]': ->
    Session.set 'email_input_changed', !(Meteor.user().emails[0].address == $('input[name="email"]').val())