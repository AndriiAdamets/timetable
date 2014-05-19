Template.EditProfile.username = ->
  console.log Meteor.users.find().fetch().usrname
  Meteor.users.find().fetch().usrname

Template.EditProfile.email = ->
  Meteor.users.find().fetch().email