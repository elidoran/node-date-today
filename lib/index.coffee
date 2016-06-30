
module.exports =

  isAfterToday: (date) ->
    # create a date and set its time to the last millisecond of today
    today = new Date
    today.setHours 23, 59, 59, 999 # hours, minutes, seconds, milliseconds
    # compare as numbers
    date.getTime() > today.getTime()


  isBeforeToday: (date) ->
    # create a date and set its time to the first millisecond of today
    today = new Date
    today.setHours 0, 0, 0, 0 # hours, minutes, seconds, milliseconds
    # compare as numbers
    date.getTime() < today.getTime()

  isToday: (date) ->
    now = new Date
    now.getDate() is date.getDate() and
      now.getMonth() is date.getMonth() and
      now.getFullYear() is date.getFullYear()
