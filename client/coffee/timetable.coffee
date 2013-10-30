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
	Groups.find()
Template.mainTable.items = ->
	Timetable.find()

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
		classNums = _.uniq(_(Timetable.find(dayNo: i).fetch()).pluck "classNo", false)
		for j in classNums
			table[i][j] = {}
			grps = _.uniq(_(Timetable.find(dayNo: i).fetch()).pluck "group", false)	
			for k in grps
				table[i][j][k] = Timetable.findOne(dayNo: i, classNo:j, group: k).classes
				# table[i][j][k] = Classes
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



# Template.dayTimetable.classesNums = ->
# 	_.uniq(_(Timetable.find(dayNo:@.valueOf()).fetch()).pluck "classNo", false)


# Template.dayTimetable.groups = ->
# 	Groups.find()

# Template.dayTimetable.classes = ->
# 	Timetable.findOne(group:@._id)


	# Class = Timetable.findOne(dayNo:Session.get "curDay", classNo: Session.get "curClassNo", group:@._id).classes
	# if (Class.all is undefined)
	# 	return 1
	# return 0
	# day = Session.get "curDay"
	# num = Session.get "curClassNo"
	# subj = Timetable.findOne(dayNo:day, classNo: num, group:@._id)
	# if Subj.classes.all is undefined
	# 	Session.set "classesType", "flasher"
	# else
	# 	Session.set "classesType", "stab"
	# subj
Template.dayTimetable.classesCount = ->
	_.keys(@.value).length+1

	#_.uniq(_(Timetable.find(dayNo:@.valueOf()).fetch()).pluck "classNo", false).length+1
	

#Template.dayTimetable.classesCount = ->
	


# Template.mainTable.lecturerName = ->
# 	Lecturers.findOne(_id = @lecturer).Soname

# Template.mainTable.subjectTitle = ->
# 	Subjects.findOne(_id = @subject).Title