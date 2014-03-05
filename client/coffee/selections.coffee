window.display_for_groups = ->
  active_groups = Session.get "active_groups"
  active_lecturers = Session.get "active_lecturers"
  active_classrooms = Session.get "active_classrooms"
  table = {}
  grps_selector = {}
  if (active_groups and active_groups.length > 0)
    grps_selector._id = {$in: active_groups}
  # i: number of day
  # j: number of class
  # k: group
  dayNums = _.uniq(_(Timetable.find().fetch()).pluck "dayNo", false)
  for i in dayNums
    table[i] = {}
    classNums = _.uniq(_(Timetable.find().fetch()).pluck "classNo", false)
    for j in classNums
      table[i][j] = {}
      grps = _.uniq(_(Groups.find(grps_selector, {sort:{Title:1}}).fetch()).pluck "_id", false)
      for k in grps
        table[i][j][k] = {}
        for l in ['all', 'top', 'bot']
          if Timetable.findOne(dayNo: i, classNo:j, group: k, type: l)
            selector = {}
            selector.dayNo = i
            selector.classNo = j
            selector.group = k
            selector.type = l
            selector.lecturer = {$in: active_lecturers} if (active_lecturers and active_lecturers.length > 0)
            table[i][j][k][l] = Timetable.findOne(selector)
          else
            table[i][j][k][l] = {}
      if Session.equals "showEmptyClasses", false
        hasClasses = false
        for l in grps
          hasClasses = true if _.keys(table[i][j][l]).length
        delete table[i][j] unless hasClasses
      if Session.equals "showEmptyClasses", false
        delete table[i] unless _.keys(table[i]).length
  table


window.display_for_lecturers = ->
  active_groups = Session.get "active_groups"
  active_lecturers = Session.get "active_lecturers"
  active_classrooms = Session.get "active_classrooms"
  dayNums = _.uniq(_(Timetable.find().fetch()).pluck "dayNo", false)
  table = {}
  lctrs_selector = {}
  if (active_lecturers and active_lecturers.length > 0)
    lctrs_selector._id = {$in: active_lecturers}
  # i: number of day
  # j: number of class
  # k: lecturer
  dayNums = _.uniq(_(Timetable.find().fetch()).pluck "dayNo", false)
  for i in dayNums
    table[i] = {}
    classNums = _.uniq(_(Timetable.find().fetch()).pluck "classNo", false)
    for j in classNums
      table[i][j] = {}
      lctrs = _.uniq(_(Lecturers.find(lctrs_selector, {sort:{Surname:1}}).fetch()).pluck "_id", false)
      for k in lctrs
        table[i][j][k] = {}
        for l in ['all', 'top', 'bot']
          if Timetable.findOne(dayNo: i, classNo:j, lecturer: k, type: l)
            selector = {}
            selector.dayNo = i
            selector.classNo = j
            selector.lecturer = k
            selector.type = l
            # selector.lecturer = {$in: active_lecturers} if (active_lecturers and active_lecturers.length > 0)
            table[i][j][k][l] = Timetable.findOne(selector)
          else
            table[i][j][k][l] = {}
      if Session.equals "showEmptyClasses", false
        hasClasses = false
        for l in grps
          hasClasses = true if _.keys(table[i][j][l]).length
        delete table[i][j] unless hasClasses
      if Session.equals "showEmptyClasses", false
        delete table[i] unless _.keys(table[i]).lengt
  table

window.display_for_classrooms = ->
  active_groups = Session.get "active_groups"
  active_lecturers = Session.get "active_lecturers"
  active_classrooms = Session.get "active_classrooms"
  dayNums = _.uniq(_(Timetable.find().fetch()).pluck "dayNo", false)
  table = {}
  class_selector = {}
  if (active_classrooms and active_classrooms.length > 0)
    class_selector._id = {$in: active_classrooms}
  # i: number of day
  # j: number of class
  # k: classroom
  dayNums = _.uniq(_(Timetable.find().fetch()).pluck "dayNo", false)
  for i in dayNums
    table[i] = {}
    classNums = _.uniq(_(Timetable.find().fetch()).pluck "classNo", false)
    for j in classNums
      table[i][j] = {}
      classes = _.uniq(_(Classrooms.find(class_selector, {sort:{num:1}}).fetch()).pluck "_id", false)
      for k in classes
        table[i][j][k] = {}
        for l in ['all', 'top', 'bot']
          if Timetable.findOne(dayNo: i, classNo:j, classRoom: k, type: l)
            selector = {}
            selector.dayNo = i
            selector.classNo = j
            selector.classRoom = k
            selector.type = l
            # selector.lecturer = {$in: active_lecturers} if (active_lecturers and active_lecturers.length > 0)
            table[i][j][k][l] = Timetable.findOne(selector)
          else
            table[i][j][k][l] = {}
          # console.log "Find:", table[i][j][k][l]
      if Session.equals "showEmptyClasses", false
        hasClasses = false
        for l in grps
          hasClasses = true if _.keys(table[i][j][l]).length
        delete table[i][j] unless hasClasses
      if Session.equals "showEmptyClasses", false
        delete table[i] unless _.keys(table[i]).length
  table