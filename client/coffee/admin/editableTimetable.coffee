Template.timetableEditable.data = ->
	display_for_admin()

Template.timetableEditable.headCells = ->
	_(Classrooms.find({}, {sort:{num:1}}).fetch()).pluck "num"
