DaysOfWeek = ["Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота"]

Handlebars.registerHelper('arrayify', (obj)->
    result = []
    for key of obj
    	result.push({name:key,value:obj[key]})
    result
	)

Lecturers = new Meteor.Collection "lecturers"
Timetable = new Meteor.Collection "timetable"
Subjects = new Meteor.Collection "subjects"
Groups = new Meteor.Collection "groups"

TimetableHandle = Meteor.subscribe "timetable"
LecturersHandle = Meteor.subscribe "lecturers"
SubjectsHandle = Meteor.subscribe "subjects"
GroupsHandle = Meteor.subscribe "groups"


Template.mainTable.loading = ->
	TimetableHandle and not TimetableHandle.ready()

Template.mainTable.groups = ->
	Groups.find({}, {sort:{Title:1}})

Template.mainTable.loadingGroups = ->
	GroupsHandle and not GroupsHandle.ready()

Template.mainTable.loadngLecturers = ->
	LecturersHandle and not LecturersHandle.ready()

Template.mainTable.loadingSubjects = ->
	SubjectsHandle and not SubjectsHandle.ready()

Template.mainTable.workDays = ->
	dayNums = _.uniq(_(Timetable.find().fetch()).pluck "dayNo", false)
	table = {}
	for i in dayNums
		table[i] = {}
		# classNums = _.uniq(_(Timetable.find(dayNo: i).fetch()).pluck "classNo", false)
		classNums = _.uniq(_(Timetable.find().fetch()).pluck "classNo", false)
		for j in classNums
			table[i][j] = {}
			# grps = _.uniq(_(Timetable.find(dayNo: i).fetch()).pluck "group", false)	
			grps = _.uniq(_(Timetable.find().fetch()).pluck "group", false)	
			for k in grps
				if Timetable.findOne(dayNo: i, classNo:j, group: k) isnt undefined
					table[i][j][k] = Timetable.findOne(dayNo: i, classNo:j, group: k).classes
				else
					table[i][j][k] = {}
	table
		

Template.dayTimetable.dayTitle = ->
	DaysOfWeek[@.name-1]

Template.dayTimetable.allSubj = ->
	Subjects.findOne(_id : @.value.all.subject).Title

Template.dayTimetable.allLect = ->
	Lecturers.findOne(_id : @.value.all.lecturer).Soname

Template.dayTimetable.topSubj = ->
	Subjects.findOne(_id : @.value.top.subject).Title

Template.dayTimetable.topLect = ->
	Lecturers.findOne(_id : @.value.top.lecturer).Soname

Template.dayTimetable.botSubj = ->
	Subjects.findOne(_id : @.value.bot.subject).Title

Template.dayTimetable.botLect = ->
	Lecturers.findOne(_id : @.value.bot.lecturer).Soname


Template.dayTimetable.classesCount = ->
	_.keys(@.value).length+1

Template.daysList.days = ->
	dayNums = _.uniq(_(Timetable.find().fetch()).pluck "dayNo", false)

Template.daysList.loading = ->
	TimetableHandle and not TimetableHandle.ready()

Template.daysList.title = ->
	DaysOfWeek[@-1]