Template.mainTemplate.data = ->
  display_for_groups()

Template.mainTable.loading = ->
  TimetableHandle and not TimetableHandle.ready()

Template.mainTable.Groups = ->
  displayedGroupId = Session.get "displayedGroup"
  if displayedGroupId is undefined
    Groups.find({}, {sort:{Title:1}})
  else
    Groups.find({_id: displayedGroupId}, {sort:{Title:1}})

Template.mainTable.Lecturers = ->
  displayedLecturerId = Session.get "displayedLecturer"
  if Session.equals "displayedLecturer", undefined
    classes = Timetable.find().collection.docs
    lctrs = {}
    for k,c of classes
      for l in ["bot", "top", "all"]
        lctrs[c.classes[l].lecturer] = 1 if c.classes[l]
    lctrs = _.keys(lctrs)
  else
    Lecturers.find(_id: displayedLecturerId)

Template.mainTable.lectName = ->
  if @_id is undefined
    lecturer = Lecturers.findOne(_id:@.toString())
    lecturer.Surname+" "+lecturer.Name[0]+". "+ lecturer.Patronymic[0]+"."
  else
    @.Surname+" "+@Name[0]+". "+ @Patronymic[0]+"."

Template.mainTable.loadingGroups = ->
  GroupsHandle and not GroupsHandle.ready()

Template.mainTable.displayedForGroups = ->
  Session.get "displayedForGroups"

Template.mainTable.loadngLecturers = ->
  LecturersHandle and not LecturersHandle.ready()

Template.mainTable.loadingSubjects = ->
  SubjectsHandle and not SubjectsHandle.ready()

Template.mainTable.studyDays = ->
  display_for_groups()
  # displayedGroupId = Session.get "displayedGroup"
  # dayNums = _.uniq(_(Timetable.find().fetch()).pluck "dayNo", false)
  # table = {}
  # for i in dayNums
  #   table[i] = {}
  #   classNums = _.uniq(_(Timetable.find().fetch()).pluck "classNo", false)
  #   for j in classNums
  #     table[i][j] = {}
  #     if displayedGroupId is undefined
  #       grps = _.uniq(_(Timetable.find().fetch()).pluck "group", false)
  #     else
  #       # grps = _.uniq(_(Timetable.find('$or': [{group: displayedGroupId}, {group: GroupId2}]).fetch()).pluck "group", false)
  #       grps = _.uniq(_(Timetable.find({group: displayedGroupId}).fetch()).pluck "group", false)
  #     for k in grps
  #       if Timetable.findOne(dayNo: i, classNo:j, group: k) isnt undefined
  #         table[i][j][k] = Timetable.findOne(dayNo: i, classNo:j, group: k).classes
  #       else
  #         table[i][j][k] = {}
  #     if Session.equals "showEmptyClasses", false
  #       hasClasses = false
  #       for l in grps
  #         hasClasses = true if _.keys(table[i][j][l]).length
  #       delete table[i][j] unless hasClasses
  #   if Session.equals "showEmptyClasses", false
  #     delete table[i] unless _.keys(table[i]).length
  # table

# Template.mainTable.workDays = ->
#   displayedLecturerId = Session.get "displayedLecturer"
#   # Days of week
#   dayNums = _.uniq(_(Timetable.find().fetch()).pluck "dayNo", false)
#   table = {}
#   for i in dayNums
#     table[i] = {}
#     classNums = _.uniq(_(Timetable.find().fetch()).pluck "classNo", false)
#       # Numbers of classes
#     for j in classNums
#       table[i][j] = {}
#       classes = Timetable.find().fetch()
#       lctrs = {}
#       if displayedLecturerId is undefined
#         for c in classes
#           for l in ["bot", "top", "all"] #when c[l]
#             lctrs[c.classes[l].lecturer] = 1 if c.classes[l]
#       else
#         lctrs[displayedLecturerId] = 1
#       lctrs = _.keys(lctrs)

#       for k in lctrs
#         allClasses = Timetable.find({dayNo: i, classNo:j}).fetch()
#         Class = {}
#         for m in allClasses
#           for m1 in ["bot", "top", "all"]
#             if m.classes[m1]
#               if m.classes[m1].lecturer is k
#                 Class[m1] = m.classes[m1] unless Class[m1]
#                 if Class[m1].groups
#                   Class[m1].groups.push m.group
#                 else
#                   Class[m1].groups = [m.group]
#         table[i][j][k] = Class
#       if Session.equals "showEmptyClasses", false
#         hasClasses = false
#         for l in lctrs
#           hasClasses = true if _.keys(table[i][j][l]).length
#         delete table[i][j] unless hasClasses
#     if Session.equals "showEmptyClasses", false
#       delete table[i] unless _.keys(table[i]).length
#   table
