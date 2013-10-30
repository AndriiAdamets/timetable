# Lecturer {Soname, Name, e-mail, phone}
# Student {Name, group, email}
# Subject {Title, Description}
# Group {Title, type, department, year} type can be bachelor, specialist or master
# Titmetable {GroupID, SubjectID, LecturerID, dayNo, weekNum, classNo, classRoom}
Lecturers = new Meteor.Collection "lecturers"
Students = new Meteor.Collection "students"
Subjects = new Meteor.Collection "subjects"
Groups = new Meteor.Collection "groups"
Timetable = new Meteor.Collection "timetable"

Meteor.startup ->
	#console.log "Server started"
	if Meteor.users.find().count() is 0
		adm = 
			username: "admin"
			password: "admin"
			provile:
				type: "admin"
		Accounts.createUser adm
	else
		console.log Meteor.users.find().count()+" users in DB"

	if Lecturers.find().count() is 0
		Lecturers.insert(
			Soname:"Петренко",
			Name:"Татьяна Григорьевна",
			email:"tgpetrenko55@gmail.com"
			)
		Lecturers.insert(
			Soname: "Шарий",
			Name: "Тимофей Вячеславович"
			)
		Lecturers.insert(
			Soname: "Тимчук",
			Name: "Олег Сергеевич"
			)
		Lecturers.insert(
			Soname: "Новакова",
			Name: "Наталья Андреевна"
			)
		Lecturers.insert(
			Soname: "Шарий",
			Name: "Тимофей Вячеславович"
			)
		Lecturers.insert(
			Soname: "Толстых",
			Name: "Виктор Константинович"
			)
		Lecturers.insert(
			Soname: "Ломонос",
			Name: "Ярослав Геннадиевич"
			)
		Lecturers.insert(
			Soname: "Сапунов",
			Name: "С В"
			)
		Lecturers.insert(
			Soname: "Сальков",
			Name: "Игорь Григорьевич"
			)
		Lecturers.insert(
			Soname: "Епик",
			Name: "Марина Александровна"
			)
		Lecturers.insert(
			Soname: "Быковская",
			Name: "Наталья Владиславовна"
			)
		console.log "Lecturers was added to DB"
	else
		console.log Lecturers.find().count()+" lecturers in DB"

	if Subjects.find().count() is 0
		Subjects.insert(
			Title: "Вычислительный Интелект"
			)
		Subjects.insert(
			Title: "Распределённые Вычисления"
			)
		Subjects.insert(
			Title: "WEB-дизайн"
			)
		Subjects.insert(
			Title: "Управление информацией и знаниями"
			)
		Subjects.insert(
			Title: "Современные Internet-технологии"
			)
		Subjects.insert(
			Title: "УИЗ"
			)
		Subjects.insert(
			Title: "Рендеринг"
			)
		Subjects.insert(
			Title: "Социальная Защита"
			)
		Subjects.insert(
			Title: "Охрана Труда"
			)
		Subjects.insert(
			Title: "Технологии Искуственного Интелекта"
			)
		console.log "Subjects was added to DB"
	else
		console.log Subjects.find().count()+" subjects in DB"

	if Groups.find().count() is 0
		Groups.insert(
			Title: "СИИ2",
			Type: "Специалист",
			Department: "Физико-технический",
			Year: "2013"
			)
		console.log "Groups was added to DB"
	else
		console.log Groups.find().count()+" groups in DB"


	if Timetable.find().count() is 0
		Timetable.insert(
			group: Groups.findOne(Title:"СИИ2")._id,
			classes: {
				all: {
					subject: Subjects.findOne(Title:"Распределённые Вычисления")._id,
					lecturer: Lecturers.findOne(Name: "Ярослав Геннадиевич")._id,
					classRoom: 408		
				}
			},
			dayNo: 1,
			classNo: 1
		)
		Timetable.insert(
			group: Groups.findOne(Title:"СИИ2")._id,
			classes: {
				but: {
					subject: Subjects.findOne(Title:"Распределённые Вычисления")._id,
					lecturer: Lecturers.findOne(Name: "Ярослав Геннадиевич")._id,
					classRoom: 402
				}
			},
			dayNo: 1,
			classNo: 2
		)
		Timetable.insert(
			group: Groups.findOne(Title:"СИИ2")._id,
			classes: {
				all: {
					subject: Subjects.findOne(Title:"WEB-дизайн")._id,
					lecturer: Lecturers.findOne(Name: "Наталья Андреевна")._id,
					classRoom: 402
				}
			},
			dayNo: 2,
			classNo: 4
		)
		Timetable.insert(
			group: Groups.findOne(Title:"СИИ2")._id
			classes: {
				all: {
					subject: Subjects.findOne(Title:"Современные Internet-технологии")._id,
					lecturer: Lecturers.findOne(Name: "Виктор Константинович")._id,
					classRoom: 416
				}
			}
			dayNo: 2,
			classNo: 5
		)
		# Timetable.insert(
		# 	group: Groups.findOne(Title:"СИИ2")._id, 
		# 	subject: Subjects.findOne(Title:"WEB-дизайн")._id,
		# 	lecturer: Lecturers.findOne(Name: "Наталья Андреевна")._id,
		# 	dayNo: 2,
		# 	weekNum: 1,
		# 	classNo: 6,
		# 	classRoom: 409
		# )
		# Timetable.insert(
		# 	group: Groups.findOne(Title:"СИИ2")._id, 
		# 	subject: Subjects.findOne(Title:"Современные Internet-технологии")._id,
		# 	lecturer: Lecturers.findOne(Name: "Виктор Константинович")._id,
		# 	dayNo: 2,
		# 	weekNum: 2,
		# 	classNo: 6,
		# 	classRoom: 408
		# )
		# Timetable.insert(
		# 	group: Groups.findOne(Title:"СИИ2")._id, 
		# 	subject: Subjects.findOne(Title:"Вычислительный Интелект")._id,
		# 	lecturer: Lecturers.findOne(Name: "С В")._id,
		# 	dayNo: 3,
		# 	weekNum: 2,
		# 	classNo: 1,
		# 	classRoom: 408
		# )
		# Timetable.insert(
		# 	group: Groups.findOne(Title:"СИИ2")._id, 
		# 	subject: Subjects.findOne(Title:"Управление информацией и знаниями")._id,
		# 	lecturer: Lecturers.findOne(Name: "Тимофей Вячеславович")._id,
		# 	dayNo: 3,
		# 	weekNum: 2,
		# 	classNo: 3,
		# 	classRoom: 402
		# )
		# Timetable.insert(
		# 	group: Groups.findOne(Title:"СИИ2")._id, 
		# 	subject: Subjects.findOne(Title:"Управление информацией и знаниями")._id,
		# 	lecturer: Lecturers.findOne(Name: "Тимофей Вячеславович")._id,
		# 	dayNo: 3,
		# 	weekNum: 0,
		# 	classNo: 4,
		# 	classRoom: 416
		# )
		# Timetable.insert(
		# 	group: Groups.findOne(Title:"СИИ2")._id, 
		# 	subject: Subjects.findOne(Title:"Вычислительный Интелект")._id,
		# 	lecturer: Lecturers.findOne(Name: "С В")._id,
		# 	dayNo: 3,
		# 	weekNum: 0,
		# 	classNo: 4,
		# 	classRoom: 408
		# )
		# Timetable.insert(
		# 	group: Groups.findOne(Title:"СИИ2")._id, 
		# 	subject: Subjects.findOne(Title:"Вычислительный Интелект")._id,
		# 	lecturer: Lecturers.findOne(Name: "С В")._id,
		# 	dayNo: 3,
		# 	weekNum: 0,
		# 	classNo: 5,
		# 	classRoom: 408
		# )
		# Timetable.insert(
		# 	group: Groups.findOne(Title:"СИИ2")._id, 
		# 	subject: Subjects.findOne(Title:"Современные Internet-технологии")._id,
		# 	lecturer: Lecturers.findOne(Name: "Виктор Константинович")._id,
		# 	# classes: {
		# 	# 	top: {}
		# 	# 	but: {}
		# 	# 	all: {}
		# 	# }
		# 	dayNo: 3,
		# 	weekNum: 0,
		# 	classNo: 6,
		# 	classRoom: 413
		# )
		console.log "Classes added to DB"
	else
		console.log Timetable.find().count()+ " classes in timetable"
	#console.log Groups.findOne(Title:"СИИ2")._id

		# Titmetable {GroupID, SubjectID, LecturerID, dayNo, weekNum, classNo, classRoom}
		# Group {Title, type, department, year} type can be bachelor, specialist or master

	#if Subjects.find().count() is 0
		#Subjects.insert
Meteor.publish "groups", () ->
	Groups.find()
Meteor.publish "lecturers", () ->
	Lecturers.find()
Meteor.publish "subjects", () ->
	Subjects.find()
Meteor.publish "timetable", () ->
	Timetable.find()