Template.EditProfile.username = ->
  console.log Meteor.user().username
  Meteor.user().username

Template.EditProfile.email = ->
  Meteor.user().emails[0].address

# Template.EditProfile.newEmail = ->
#   $('input[name="email"]').val() != Meteor.user().emails[0].address

Template.EditProfile.mailNotVerified = ->
  Meteor.user().emails[0].verified isnt true
