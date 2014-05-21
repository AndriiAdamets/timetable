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

Template.EditProfile.passEqual = ->
  Session.get 'passEqual'

Template.EditProfile.loginChanged = ->
  Session.get 'loginChanged'

Template.EditProfile.PasswordChanged = ->
  Session.get 'PasswordChanged'



Template.EditProfile.mailNotVerified = ->
  (Session.equals 'email_verified', false) and (Session.equals 'email_input_changed', false)

Template.EditProfile.events
  'keyup input[name="userpass"]': ->
    Session.set 'password_input_changed', true
  'keyup input[name="username"]': ->
    Session.set 'username_input_changed', !(Meteor.user().username == $('input[name="username"]').val())
  'keyup input[name="email"]': ->
    Session.set 'email_input_changed', !(Meteor.user().emails[0].address == $('input[name="email"]').val())
  'keyup input[name="userpass"],input[name="confirmpass"]': ->
      Session.set 'passEqual', $('input[name="userpass"]').val() is $('input[name="confirmpass"]').val()
  'click #changeUsername': ->
    Meteor.call 'newLogin', $('input[name="username"]').val()
    console.log Meteor.user()
    Session.set 'loginChanged', true
  'click #newMail': ->
    Meteor.call 'newEmail', $('input[name="email"]').val()
    Session.set 'email_input_changed', false
  'click #verifyMail': ->
    Meteor.call 'sendVerificationMail'
  'click #changePassword': ->
    Meteor.call('newPassword', $('input[name="userpass"]').val())
    Session.set 'PasswordChanged', true
