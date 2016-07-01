assert = require 'assert'
fns    = require '../../lib'

dates = now: new Date

dates.firstToday = new Date
dates.firstToday.setHours 0, 0, 0, 0

dates.lastToday = new Date
dates.lastToday.setHours 23, 59, 59, 999

dates.firstYesterday = new Date
dates.firstYesterday.setDate dates.firstYesterday.getDate() - 1
dates.firstYesterday.setHours 0, 0, 0, 0

dates.lastYesterday = new Date
dates.lastYesterday.setDate dates.lastYesterday.getDate() - 1
dates.lastYesterday.setHours 23, 59, 59, 999

dates.firstTomorrow = new Date
dates.firstTomorrow.setDate dates.firstTomorrow.getDate() + 1
dates.firstTomorrow.setHours 0, 0, 0, 0

dates.lastTomorrow = new Date
dates.lastTomorrow.setDate dates.lastTomorrow.getDate() + 1
dates.lastTomorrow.setHours 23, 59, 59, 999

dates.farFuture = new Date 2199, 11, 31
dates.farPast   = new Date 1999, 0, 1

tests =
  isAfterToday: [
    { date: dates.now, result: false, description: 'now'}
    { date: dates.farPast, result: false, description: 'far past' }
    { date: dates.farFuture, result: true, description: 'far future' }
    { date: dates.firstYesterday, result: false, description: 'first millisecond of yesterday' }
    { date: dates.lastYesterday, result: false, description: 'last millisecond of yesterday' }
    { date: dates.firstToday, result: false, description: 'first millisecond of today' }
    { date: dates.lastToday, result: false, description: 'last millisecond of today' }
    { date: dates.firstTomorrow, result: true, description: 'first millisecond of tomorrow' }
    { date: dates.lastTomorrow, result: true, description: 'last millisecond of tomorrow' }
  ]

  isBeforeToday: [
    { date: dates.now, result: false, description: 'now'}
    { date: dates.farPast, result: true, description: 'far past' }
    { date: dates.farFuture, result: false, description: 'far future' }
    { date: dates.firstYesterday, result: true, description: 'first millisecond of yesterday' }
    { date: dates.lastYesterday, result: true, description: 'last millisecond of yesterday' }
    { date: dates.firstToday, result: false, description: 'first millisecond of today' }
    { date: dates.lastToday, result: false, description: 'last millisecond of today' }
    { date: dates.firstTomorrow, result: false, description: 'first millisecond of tomorrow' }
    { date: dates.lastTomorrow, result: false, description: 'last millisecond of tomorrow' }
  ]

  isToday: [
    { date: dates.now, result: true, description: 'now'}
    { date: dates.farPast, result: false, description: 'far past' }
    { date: dates.farFuture, result: false, description: 'far future' }
    { date: dates.firstYesterday, result: false, description: 'first millisecond of yesterday' }
    { date: dates.lastYesterday, result: false, description: 'last millisecond of yesterday' }
    { date: dates.firstToday, result: true, description: 'first millisecond of today' }
    { date: dates.lastToday, result: true, description: 'last millisecond of today' }
    { date: dates.firstTomorrow, result: false, description: 'first millisecond of tomorrow' }
    { date: dates.lastTomorrow, result: false, description: 'last millisecond of tomorrow' }
  ]

describe 'test', ->

  for name, array of tests

    do (name, array) ->

      describe name + '() ', ->

        for test in array

          do (test) ->

            it "should return #{test.resultString ? test.result} when it's #{test.description}", ->

              date =
                if typeof test.date is 'function' then test.date()
                else test.date

              arg = test.options ? date
              if test.options? then arg.date = test.date

              result = fns[name] arg

              if test.result instanceof Date
                assert.equal test.result.getTime(), result.getTime()
              else
                assert.equal test.result, result
