# Lecturer {Surname, Name, e-mail, phone}
# Student {Name, group, email}
# Subject {Title, Description}
# Group {Title, type, department, year} type can be bachelor, specialist or master
# Classroom {num, roomines}
# Titmetable {GroupID, SubjectID, LecturerID, dayNo, weekNum, classNo, classRoom}
Lecturers = new Meteor.Collection "lecturers"
Students = new Meteor.Collection "students"
Subjects = new Meteor.Collection "subjects"
Groups = new Meteor.Collection "groups"
Classrooms = new Meteor.Collection "classrooms"
Timetable = new Meteor.Collection "timetable"

Meteor.startup ->
  #console.log "Server started"
  if Meteor.users.find().count() is 0
    adm =
        username: "admin"
        password: "admin"
        profile:
            type: "admin"
    Accounts.createUser adm
  else
    console.log Meteor.users.find().count()+" users in DB"

  if Lecturers.find().count() is 0
    Lecturers.insert(
      Surname:"Петренко"
      Name:"Татьяна"
      Patronymic: "Григорьевна"
      email:"tgpetrenko55@gmail.com"
      )

    Lecturers.insert(
      Surname: "Шарий"
      Name: "Тимофей"
      Patronymic: "Вячеславович"
      )

    Lecturers.insert(
      Surname: "Тимчук"
      Name: "Олег"
      Patronymic: "Сергеевич"
      )

    Lecturers.insert(
      Surname: "Новакова"
      Name: "Надежда"
      Patronymic: "Андреевна"
      )

    Lecturers.insert(
      Surname: "Толстых"
      Name: "Виктор"
      Patronymic: "Константинович"
      )

    Lecturers.insert(
      Surname: "Ломонос"
      Name: "Ярослав"
      Patronymic: "Геннадиевич"
      )

    Lecturers.insert(
      Surname: "Сапунов"
      Name: "Сергей"
      Patronymic: "Валериевич"
      )

    Lecturers.insert(
      Surname: "Сальков"
      Name: "Игорь"
      Patronymic: "Григорьевич"
      )

    Lecturers.insert(
      Surname: "Епик"
      Name: "Марина"
      Patronymic: "Александровна"
      )

    Lecturers.insert(
      Surname: "Быковская"
      Name: "Наталья"
      Patronymic: "Владиславовна"
      )

    Lecturers.insert(
      Surname: "Кожемякин"
      Name: "Юрий"
      Patronymic: "Алексеевич"
      )
    console.log "Lecturers was added to DB"
  else
    console.log Lecturers.find().count()+" lecturers in DB"

  if Subjects.find().count() is 0
    Subjects.insert(
      Title: "Безопасность и защита данных"
        )
    Subjects.insert(
      Title: "Вычислительный Интеллект"
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
      Title: "Технологии Искуственного Интеллекта"
        )
    Subjects.insert(
      Title: "Оборудование компьютерных сетей"
        )
    console.log "Subjects was added to DB"
  else
    console.log Subjects.find().count()+" subjects in DB"

  if Groups.find().count() is 0
    Groups.insert(
      Title: "СИИ1"
      Type: "Специалист"
      Department: "Физико-технический"
      Year: "2013"
      Persons: 15
    )

    Groups.insert(
      Title: "СИИ2"
      Type: "Специалист"
      Department: "Физико-технический"
      Year: "2013"
      Persons: 9
    )

    Groups.insert(
      Title: "СИИ3"
      Type: "Специалист"
      Department: "Физико-технический"
      Year: "2013"
      Persons: 13
    )

    console.log "Groups was added to DB"
  else
    console.log Groups.find().count()+" groups in DB"

  if  Classrooms.find().count() is 0
    Classrooms.insert(
      num: 312
      roomines: 20
    )

    Classrooms.insert(
      num: 402
      roomines: 20
    )

    Classrooms.insert(
      num: 408
      roomines: 40
    )

    Classrooms.insert(
      num: 409
      roomines: 15
    )

    Classrooms.insert(
      num: 413
      roomines: 15
    )

    Classrooms.insert(
      num: 415
      roomines: 20
    )

    Classrooms.insert(
      num: 416
      roomines: 40
    )

  else
    console.log Classrooms.find().count()+" classrooms in DB"


  if Timetable.find().count() is 0
    # ============================Понедельник===================================
    Timetable.insert(
      group: Groups.findOne(Title:"СИИ1")._id
      type: "all"
      subject: Subjects.findOne(Title:"Распределённые Вычисления")._id
      lecturer: Lecturers.findOne(Name: "Ярослав")._id
      classRoom: Classrooms.findOne(num: 408)._id
      dayNo: 1
      classNo: 1
    )

    Timetable.insert(
      group: Groups.findOne(Title:"СИИ2")._id
      type: "all"
      subject: Subjects.findOne(Title:"Распределённые Вычисления")._id
      lecturer: Lecturers.findOne(Name: "Ярослав")._id
      classRoom: Classrooms.findOne(num: 408)._id
      dayNo: 1
      classNo: 1
    )

    Timetable.insert(
      group: Groups.findOne(Title:"СИИ3")._id
      type: "all"
      subject: Subjects.findOne(Title:"Распределённые Вычисления")._id
      lecturer: Lecturers.findOne(Name: "Ярослав")._id
      classRoom: Classrooms.findOne(num: 408)._id
      dayNo: 1
      classNo: 1
    )
    Timetable.insert(
      group: Groups.findOne(Title:"СИИ1")._id
      type: "all"
      subject: Subjects.findOne(Title:"Распределённые Вычисления")._id
      lecturer: Lecturers.findOne(Name: "Ярослав")._id
      classRoom: Classrooms.findOne(num: 402)._id
      dayNo: 1
      classNo: 2
    )
    Timetable.insert(
      group: Groups.findOne(Title:"СИИ2")._id
      type: "bot"
      subject: Subjects.findOne(Title:"Распределённые Вычисления")._id
      lecturer: Lecturers.findOne(Name: "Ярослав")._id
      classRoom: Classrooms.findOne(num: 402)._id
      dayNo: 1
      classNo: 2
    )

    Timetable.insert(
      group: Groups.findOne(Title:"СИИ3")._id
      type: "bot"
      subject: Subjects.findOne(Title:"Распределённые Вычисления")._id
      lecturer: Lecturers.findOne(Name: "Ярослав")._id
      classRoom: Classrooms.findOne(num: 402)._id
      dayNo: 1
      classNo: 3
    )

    # ============================Вторник===================================
    Timetable.insert(
      group: Groups.findOne(Title:"СИИ1")._id
      type: "bot"
      subject: Subjects.findOne(Title:"Безопасность и защита данных")._id
      lecturer: Lecturers.findOne(Name: "Олег")._id
      classRoom: Classrooms.findOne(num: 416)._id
      dayNo: 2
      classNo: 4
    )

    Timetable.insert(
      group: Groups.findOne(Title:"СИИ2")._id
      type: "all"
      subject: Subjects.findOne(Title:"WEB-дизайн")._id
      lecturer: Lecturers.findOne(Name: "Надежда")._id
      classRoom: Classrooms.findOne(num: 402)._id
      dayNo: 2
      classNo: 4
    )

    Timetable.insert(
      group: Groups.findOne(Title:"СИИ3")._id
      type: "all"
      subject: Subjects.findOne(Title:"WEB-дизайн")._id
      lecturer: Lecturers.findOne(Name: "Надежда")._id
      classRoom: Classrooms.findOne(num: 402)._id
      dayNo: 2
      classNo: 4
    )

    Timetable.insert(
      group: Groups.findOne(Title:"СИИ1")._id
      type: "all"
      subject: Subjects.findOne(Title:"Современные Internet-технологии")._id
      lecturer: Lecturers.findOne(Name: "Виктор")._id
      classRoom: Classrooms.findOne(num: 416)._id
      dayNo: 2
      classNo: 5
    )

    Timetable.insert(
        group: Groups.findOne(Title:"СИИ2")._id
        type: "all"
        subject: Subjects.findOne(Title:"Современные Internet-технологии")._id
        lecturer: Lecturers.findOne(Name: "Виктор")._id
        classRoom: Classrooms.findOne(num: 416)._id
        dayNo: 2
        classNo: 5
    )

    Timetable.insert(
        group: Groups.findOne(Title:"СИИ3")._id
        type: "all"
        subject: Subjects.findOne(Title:"Современные Internet-технологии")._id
        lecturer: Lecturers.findOne(Name: "Виктор")._id
        classRoom: Classrooms.findOne(num: 416)._id
        dayNo: 2
        classNo: 5
    )

    Timetable.insert(
      group: Groups.findOne(Title:"СИИ1")._id
      type: "top"
      subject: Subjects.findOne(Title:"Современные Internet-технологии")._id
      lecturer: Lecturers.findOne(Name: "Виктор")._id
      classRoom: Classrooms.findOne(num: 413)._id
      dayNo: 2
      classNo: 6
    )

    Timetable.insert(
        group: Groups.findOne(Title:"СИИ1")._id
        type: "bot"
        subject: Subjects.findOne(Title:"Современные Internet-технологии")._id
        lecturer: Lecturers.findOne(Name: "Виктор")._id
        classRoom: Classrooms.findOne(num: 408)._id
        dayNo: 2
        classNo: 6
    )

    Timetable.insert(
      group: Groups.findOne(Title:"СИИ2")._id
      type: "top"
      subject: Subjects.findOne(Title:"WEB-дизайн")._id
      lecturer: Lecturers.findOne(Name: "Надежда")._id
      classRoom: Classrooms.findOne(num: 409)._id
      dayNo: 2
      classNo: 6
    )

    Timetable.insert(
      group: Groups.findOne(Title:"СИИ2")._id
      type: "bot"
      subject: Subjects.findOne(Title:"Современные Internet-технологии")._id
      lecturer: Lecturers.findOne(Name: "Виктор")._id
      classRoom: Classrooms.findOne(num: 408)._id
      dayNo: 2
      classNo: 6
    )

    Timetable.insert(
      group: Groups.findOne(Title:"СИИ3")._id
      type: "bot"
      subject: Subjects.findOne(Title:"Современные Internet-технологии")._id
      lecturer: Lecturers.findOne(Name: "Виктор")._id
      classRoom: Classrooms.findOne(num: 408)._id
      dayNo: 2
      classNo: 6
    )
    # ============================Среда===================================
    Timetable.insert(
      group: Groups.findOne(Title:"СИИ1")._id
      type: "bot"
      subject: Subjects.findOne(Title:"Вычислительный Интеллект")._id
      lecturer: Lecturers.findOne(Name: "Сергей")._id
      classRoom: Classrooms.findOne(num: 408)._id
      dayNo: 3
      classNo: 2
    )

    Timetable.insert(
      group: Groups.findOne(Title:"СИИ2")._id
      type: "bot"
      subject: Subjects.findOne(Title:"Вычислительный Интеллект")._id
      lecturer: Lecturers.findOne(Name: "Сергей")._id
      classRoom: Classrooms.findOne(num: 408)._id
      dayNo: 3
      classNo: 2
    )

    Timetable.insert(
      group: Groups.findOne(Title:"СИИ3")._id
      type: "bot"
      subject: Subjects.findOne(Title:"Вычислительный Интеллект")._id
      lecturer: Lecturers.findOne(Name: "Сергей")._id
      classRoom: Classrooms.findOne(num: 408)._id
      dayNo: 3
      classNo: 2
    )

    Timetable.insert(
        group: Groups.findOne(Title:"СИИ1")._id
        type: "top"
        subject: Subjects.findOne(Title:"Управление информацией и знаниями")._id
        lecturer: Lecturers.findOne(Name: "Тимофей")._id
        classRoom: Classrooms.findOne(num: 402)._id
        dayNo: 3
        classNo: 3
    )

    Timetable.insert(
        group: Groups.findOne(Title:"СИИ2")._id
        type: "bot"
        subject: Subjects.findOne(Title:"Управление информацией и знаниями")._id
        lecturer: Lecturers.findOne(Name: "Тимофей")._id
        classRoom: Classrooms.findOne(num: 402)._id
        dayNo: 3
        classNo: 3
    )

    Timetable.insert(
        group: Groups.findOne(Title:"СИИ1")._id
        type: "all"
        subject: Subjects.findOne(Title:"Управление информацией и знаниями")._id
        lecturer: Lecturers.findOne(Name: "Тимофей")._id
        classRoom: Classrooms.findOne(num: 416)._id
        dayNo: 3
        classNo: 4
    )

    Timetable.insert(
      group: Groups.findOne(Title:"СИИ2")._id
      type: "all"
      subject: Subjects.findOne(Title:"Управление информацией и знаниями")._id
      lecturer: Lecturers.findOne(Name: "Тимофей")._id
      classRoom: Classrooms.findOne(num: 416)._id
      dayNo: 3
      classNo: 4
    )

    Timetable.insert(
      group: Groups.findOne(Title:"СИИ3")._id
      type: "all"
      subject: Subjects.findOne(Title:"Управление информацией и знаниями")._id
      lecturer: Lecturers.findOne(Name: "Тимофей")._id
      classRoom: Classrooms.findOne(num: 416)._id
      dayNo: 3
      classNo: 4
    )

    Timetable.insert(
      group: Groups.findOne(Title:"СИИ1")._id
      type: "bot"
      subject: Subjects.findOne(Title:"Безопасность и защита данных")._id
      lecturer: Lecturers.findOne(Name: "Олег")._id
      classRoom: Classrooms.findOne(num: 415)._id
      dayNo: 3
      classNo: 5
    )

    Timetable.insert(
      group: Groups.findOne(Title:"СИИ2")._id
      type: "all"
      subject: Subjects.findOne(Title:"Вычислительный Интеллект")._id
      lecturer: Lecturers.findOne(Name: "Сергей")._id
      classRoom: Classrooms.findOne(num: 408)._id
      dayNo: 3
      classNo: 5
    )

    Timetable.insert(
      group: Groups.findOne(Title:"СИИ1")._id
      type: "all"
      subject: Subjects.findOne(Title:"Вычислительный Интеллект")._id
      lecturer: Lecturers.findOne(Name: "Сергей")._id
      classRoom: Classrooms.findOne(num: 408)._id
      dayNo: 3
      classNo: 6
    )

    Timetable.insert(
      group: Groups.findOne(Title:"СИИ2")._id
      type: "all"
      subject: Subjects.findOne(Title:"Современные Internet-технологии")._id
      lecturer: Lecturers.findOne(Name: "Виктор")._id
      classRoom: Classrooms.findOne(num: 408)._id
      dayNo: 3
      classNo: 6
    )

    Timetable.insert(
      group: Groups.findOne(Title:"СИИ3")._id
      type: "all"
      subject: Subjects.findOne(Title:"Управление информацией и знаниями")._id
      lecturer: Lecturers.findOne(Name: "Тимофей")._id
      classRoom: Classrooms.findOne(num: 408)._id
      dayNo: 3
      classNo: 6
    )
    # ============================Четверг===================================
    Timetable.insert(
      group: Groups.findOne(Title:"СИИ2")._id
      type: "all"
      subject: Subjects.findOne(Title:"Рендеринг")._id
      lecturer: Lecturers.findOne(Name: "Игорь")._id
      classRoom: Classrooms.findOne(num: 416)._id
      dayNo: 4
      classNo: 2
    )

    Timetable.insert(
      group: Groups.findOne(Title:"СИИ3")._id
      type: "all"
      subject: Subjects.findOne(Title:"Рендеринг")._id
      lecturer: Lecturers.findOne(Name: "Игорь")._id
      classRoom: Classrooms.findOne(num: 416)._id
      dayNo: 4
      classNo: 2
    )

    Timetable.insert(
      group: Groups.findOne(Title:"СИИ2")._id
      type: "all"
      subject: Subjects.findOne(Title:"Рендеринг")._id
      lecturer: Lecturers.findOne(Name: "Игорь")._id
      classRoom: Classrooms.findOne(num: 416)._id
      dayNo: 4
      classNo: 3
    )

    Timetable.insert(
      group: Groups.findOne(Title:"СИИ3")._id
      type: "all"
      subject: Subjects.findOne(Title:"Рендеринг")._id
      lecturer: Lecturers.findOne(Name: "Игорь")._id
      classRoom: Classrooms.findOne(num: 416)._id
      dayNo: 4
      classNo: 3
    )
    # ============================Пятница===================================
    Timetable.insert(
      group: Groups.findOne(Title:"СИИ1")._id
      type: "all"
      subject: Subjects.findOne(Title:"Оборудование компьютерных сетей")._id
      lecturer: Lecturers.findOne(Name: "Юрий")._id
      classRoom: Classrooms.findOne(num: 312)._id
      dayNo: 5
      classNo: 1
    )

    Timetable.insert(
      group: Groups.findOne(Title:"СИИ1")._id
      type: "all"
      subject: Subjects.findOne(Title:"Технологии Искуственного Интеллекта")._id
      lecturer: Lecturers.findOne(Name: "Марина")._id
      classRoom: Classrooms.findOne(num: 408)._id
      dayNo: 5
      classNo: 3
    )

    Timetable.insert(
      group: Groups.findOne(Title:"СИИ2")._id
      type: "all"
      subject: Subjects.findOne(Title:"Технологии Искуственного Интеллекта")._id
      lecturer: Lecturers.findOne(Name: "Марина")._id
      classRoom: Classrooms.findOne(num: 408)._id
      dayNo: 5
      classNo: 3
    )

    Timetable.insert(
      group: Groups.findOne(Title:"СИИ3")._id
      type: "all"
      subject: Subjects.findOne(Title:"Технологии Искуственного Интеллекта")._id
      lecturer: Lecturers.findOne(Name: "Марина")._id
      classRoom: Classrooms.findOne(num: 408)._id
      dayNo: 5
      classNo: 3
    )

    Timetable.insert(
      group: Groups.findOne(Title:"СИИ1")._id
      type: "top"
      subject: Subjects.findOne(Title:"Технологии Искуственного Интеллекта")._id
      lecturer: Lecturers.findOne(Name: "Марина")._id
      classRoom: Classrooms.findOne(num: 415)._id
      dayNo: 5
      classNo: 4
    )

    Timetable.insert(
      group: Groups.findOne(Title:"СИИ2")._id
      type: "bot"
      subject: Subjects.findOne(Title:"Технологии Искуственного Интеллекта")._id
      lecturer: Lecturers.findOne(Name: "Марина")._id
      classRoom: Classrooms.findOne(num: 415)._id
      dayNo: 5
      classNo: 4
    )

    Timetable.insert(
      group: Groups.findOne(Title:"СИИ3")._id
      type: "bot"
      subject: Subjects.findOne(Title:"Технологии Искуственного Интеллекта")._id
      lecturer: Lecturers.findOne(Name: "Марина")._id
      classRoom: Classrooms.findOne(num: 409)._id
      dayNo: 5
      classNo: 6
    )
    console.log "Classes added to DB"
  else
    console.log Timetable.find().count()+ " classes in timetable"

Meteor.publish "groups", ->
    Groups.find()
Meteor.publish "lecturers", ->
    Lecturers.find()
Meteor.publish "subjects", ->
    Subjects.find()
Meteor.publish "classrooms", ->
    Classrooms.find()
Meteor.publish "timetable", ->
    Timetable.find()

Meteor.methods
  removeLesson: (selector) ->
    Timetable.remove selector
