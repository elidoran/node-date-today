# @date/today
[![Build Status](https://travis-ci.org/elidoran/node-date-today.svg?branch=master)](https://travis-ci.org/elidoran/node-date-today)
[![Dependency Status](https://gemnasium.com/elidoran/node-date-today.png)](https://gemnasium.com/elidoran/node-date-today)
[![npm version](https://badge.fury.io/js/%40date%2Ftoday.svg)](http://badge.fury.io/js/%40date%2Ftoday)

Compare dates to today.

## Install

```sh
npm install @date/today --save
```

## Usage


```javascript
var test = require('@date/today')

var date = new Date()

test.isAfterToday(date)  // false
test.isBeforeToday(date) // false
test.isToday(date)       // true
```

## MIT License
