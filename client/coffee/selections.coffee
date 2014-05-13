window.display_for_groups = ->
  active_groups = Session.get "active_groups"
  active_lecturers = Session.get "active_lecturers"
  active_classrooms = Session.get "active_classrooms"
  table = {}
  grps_selector = {}
  if (active_groups and active_groups.length > 0)
    grps_selector._id = {$in: active_groups}
  selector = {}
  selector.lecturer = {$in: active_lecturers} if (active_lecturers and active_lecturers.length > 0)
  selector.classRoom = {$in: active_classrooms} if (active_classrooms and active_classrooms.length > 0)
  # i: number of day
  # j: number of class
  # k: group
  dayNums = _.uniq(_(Timetable.find().fetch()).pluck "dayNo", false)
  for i in dayNums
    selector.dayNo = i
    table[i] = {}
    classNums = _.uniq(_(Timetable.find().fetch()).pluck "classNo", false)
    for j in classNums
      selector.classNo = j
      table[i][j] = {}
      grps = _.uniq(_(Groups.find(grps_selector, {sort:{Title:1}}).fetch()).pluck "_id", false)
      for k in grps
        selector.group = k
        table[i][j][k] = {}
        for l in ['all', 'top', 'bot']
          selector.type = l
          if Timetable.findOne selector
            table[i][j][k][l] = Timetable.findOne selector

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
  selector = {}
  selector.classRoom = {$in: active_classrooms} if (active_classrooms and active_classrooms.length > 0)
  selector.group = {$in: active_groups} if (active_groups and active_groups.length > 0)
  # i: number of day
  # j: number of class
  # k: lecturer
  dayNums = _.uniq(_(Timetable.find().fetch()).pluck "dayNo", false)
  for i in dayNums
    selector.dayNo = i
    table[i] = {}
    classNums = _.uniq(_(Timetable.find().fetch()).pluck "classNo", false)
    for j in classNums
      selector.classNo = j
      table[i][j] = {}
      lctrs = _.uniq(_(Lecturers.find(lctrs_selector, {sort:{Surname:1}}).fetch()).pluck "_id", false)
      for k in lctrs
        selector.lecturer = k
        table[i][j][k] = {}
        for l in ['all', 'top', 'bot']
          selector.type = l
          if Timetable.findOne selector
            table[i][j][k][l] = Timetable.findOne selector
            # table[i][j][k][l].subject = Subjects.findOne(_id: table[i][j][k][l].subject)
            table[i][j][k][l].groups = _.uniq(_(Timetable.find(selector).fetch()).pluck "group", false)
            table[i][j][k][l].groups = _.uniq(_(Groups.find(_id: {$in: table[i][j][k][l].groups}).fetch()).pluck "Title", false)
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
  selector = {}
  selector.group = {$in: active_groups} if (active_groups and active_groups.length > 0)
  selector.lecturer = {$in: active_lecturers} if (active_lecturers and active_lecturers.length > 0)
  # i: number of day
  # j: number of class
  # k: classroom
  dayNums = _.uniq(_(Timetable.find().fetch()).pluck "dayNo", false)
  for i in dayNums
    selector.dayNo = i
    table[i] = {}
    classNums = _.uniq(_(Timetable.find().fetch()).pluck "classNo", false)
    for j in classNums
      selector.classNo = j
      table[i][j] = {}
      classes = _.uniq(_(Classrooms.find(class_selector, {sort:{num:1}}).fetch()).pluck "_id", false)
      for k in classes
        selector.classRoom = k
        table[i][j][k] = {}
        for l in ['all', 'top', 'bot']
          selector.type = l
          if Timetable.findOne selector
            table[i][j][k][l] = Timetable.findOne selector
            # table[i][j][k][l].subject = Subjects.findOne(_id: table[i][j][k][l].subject)
            table[i][j][k][l].groups = _.uniq(_(Timetable.find(selector).fetch()).pluck "group", false)
            table[i][j][k][l].groups = _.uniq(_(Groups.find(_id: {$in: table[i][j][k][l].groups}).fetch()).pluck "Title", false)
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

window.display_for_admin = ->
  # active_groups = Session.get "admin_active_groups"
  # active_lecturers = Session.get "admin_active_lecturers"
  # active_classrooms = Session.get "admin_active_classrooms"
  dayNums = _.uniq(_(Timetable.find().fetch()).pluck "dayNo", false)
  table = {}
  class_selector = {}
  # if (active_classrooms and active_classrooms.length > 0)
    # class_selector._id = {$in: active_classrooms}
  selector = {}
  # selector.group = {$in: active_groups} if (active_groups and active_groups.length > 0)
  # selector.lecturer = {$in: active_lecturers} if (active_lecturers and active_lecturers.length > 0)
  # i: number of day
  # j: number of class
  # k: classroom
  dayNums = _.uniq(_(Timetable.find().fetch()).pluck "dayNo", false)
  for i in dayNums
    selector.dayNo = i
    table[i] = {}
    classNums = _.uniq(_(Timetable.find().fetch()).pluck "classNo", false)
    for j in classNums
      selector.classNo = j
      table[i][j] = {}
      # table[i][j].dayNo = i
      # yable[i][j].classNo = j
      classes = _.uniq(_(Classrooms.find(class_selector, {sort:{num:1}}).fetch()).pluck "_id", false)
      for k in classes
        selector.classRoom = k
        table[i][j][k] = {}
        table[i][j][k].dayNo = i
        table[i][j][k].classNo = j
        table[i][j][k].classRoom = k
        for l in ['all', 'top', 'bot']
          selector.type = l
          if Timetable.findOne selector
            table[i][j][k][l] = Timetable.findOne selector
            # table[i][j][k][l].subject = Subjects.findOne(_id: table[i][j][k][l].subject)
            table[i][j][k][l].groups = _.uniq(_(Timetable.find(selector).fetch()).pluck "group", false)
            table[i][j][k][l].groups = _.uniq(_(Groups.find(_id: {$in: table[i][j][k][l].groups}).fetch()).pluck "Title", false)
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
