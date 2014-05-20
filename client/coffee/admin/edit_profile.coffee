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
  Session.equals 'username_input_changed', true

Template.EditProfile.email = ->
  Session.get 'email_address'

Template.EditProfile.inputEmailChanged = ->
  Session.equals 'email_input_changed', true

Template.EditProfile.inputPasswordChanged = ->
  Session.equals 'password_input_changed', true

Template.EditProfile.mailNotVerified = ->
  Session.equals 'email_verified', false

Template.EditProfile.events
  'keyup input[name="userpass"]': ->
    Session.set 'password_input_changed', true
  'keyup input[name="username"]': ->
    console.log 'username:', Session.get 'username'
    console.log 'val:', $('input[name="username"]').val()
    console.log 'as', Meteor.user().username == $('input[name="username"]').val()
    Session.set 'username_input_changed', !(Meteor.user().username == $('input[name="username"]').val())