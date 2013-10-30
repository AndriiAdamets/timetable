Lecturers = new Meteor.Collection "lecturers"
Timetable = new Meteor.Collection "timetable"
Subjects = new Meteor.Collection "subjects"
Groups = new Meteor.Collection "groups"

TimetableHandle = Meteor.subscribe "timetable"
LecturersHandle = Meteor.subscribe "lecturers"
SubjectsHandle = Meteor.subscribe "subjects"
GroupsHandle = Meteor.subscribe "groups"

DaysOfWeek = ["Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Суббота"]


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
		grps = Groups.find(dayNo:i)._id
		for j in grps
			table[i][j] = {}
			classNums = _.uniq(_(Timetable.find(dayNo: i, group:j).fetch()).pluck "classNo", false)
			for k in classNums
				table[i][j][k] = Timetable.findOne(dayNo: i, group: j, classNo:k).classes
				# table[i][j][k] = Classes
	table


		

Template.dayTimetable.dayTitle = ->
	Session.set "curDay", @.valueOf()#DaysOfWeek[@-1]
	DaysOfWeek[@-1]

Template.dayTimetable.classesNums = ->
	_.uniq(_(Timetable.find(dayNo:@.valueOf()).fetch()).pluck "classNo", false)


Template.dayTimetable.groups = ->
	Groups.find()

Template.dayTimetable.classes = ->
	Timetable.findOne(group:@._id)


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
	#_.uniq(_(Timetable.find(dayNo:@.valueOf()).fetch()).pluck "classNo", false).length+1
	

#Template.dayTimetable.classesCount = ->
	


# Template.mainTable.lecturerName = ->
# 	Lecturers.findOne(_id = @lecturer).Soname

# Template.mainTable.subjectTitle = ->
# 	Subjects.findOne(_id = @subject).Title