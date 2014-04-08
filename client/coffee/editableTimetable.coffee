Template.timetableEditable.data = ->
	display_for_classrooms()

Template.timetableEditable.headCells = ->
	_(Classrooms.find({}, {sort:{num:1}}).fetch()).pluck "num"