window.display_for_groups = ->
  console.log "Yeah!"
  active_groups = Session.get "active_groups"
  active_lecturers = Session.get "active_lecturers"
  active_classrooms = Session.get "active_classrooms"
  table = {}
  dayNums = _.uniq(_(Timetable.find().fetch()).pluck "dayNo", false)
  for i in dayNums
    table[i] = {}
    classNums = _.uniq(_(Timetable.find().fetch()).pluck "classNo", false)
    for j in classNums
      table[i][j] = {}
      if active_groups is undefined
        grps = _.uniq(_(Timetable.find().fetch()).pluck "group", false)
      else
        grps = _.uniq(_(Timetable.find(group: {$in: active_groups}).fetch()).pluck "group", false)
      for k in grps
        if Timetable.findOne(dayNo: i, classNo:j, group: k) isnt undefined
          table[i][j][k] = Timetable.findOne(dayNo: i, classNo:j, group: k)
        else
          table[i][j][k] = {}
      if Session.equals "showEmptyClasses", false
        hasClasses = false
        for l in grps
          hasClasses = true if _.keys(table[i][j][l]).length
        delete table[i][j] unless hasClasses
      if Session.equals "showEmptyClasses", false
        delete table[i] unless _.keys(table[i]).length
  console.log table
  table


window.display_for_lecturers = ->
  active_groups = Session.get "active_groups"
  active_lecturers = Session.get "active_lecturers"
  active_classrooms = Session.get "active_classrooms"
  dayNums = _.uniq(_(Timetable.find().fetch()).pluck "dayNo", false)

window.display_for_classrooms = ->
  active_groups = Session.get "active_groups"
  active_lecturers = Session.get "active_lecturers"
  active_classrooms = Session.get "active_classrooms"
  dayNums = _.uniq(_(Timetable.find().fetch()).pluck "dayNo", false)
