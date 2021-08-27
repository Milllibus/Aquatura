import Calendar from 'tui-calendar';

function getTimeTemplate(schedule, isAllDay) {
  const html = [];

  if (!isAllDay) {
    html.push('<strong>' + moment(schedule.start.getTime()).format('HH:mm') + '</strong> ');
  }
  if (schedule.isPrivate) {
    html.push('<span class="calendar-font-icon ic-lock-b"></span>');
    html.push(' Private');
  } else {
    if (schedule.isReadOnly) {
      html.push('<span class="calendar-font-icon ic-readonly-b"></span>');
    } else if (schedule.recurrenceRule) {
      html.push('<span class="calendar-font-icon ic-repeat-b"></span>');
    } else if (schedule.attendees.length) {
      html.push('<span class="calendar-font-icon ic-user-b"></span>');
    } else if (schedule.location) {
      html.push('<span class="calendar-font-icon ic-location-b"></span>');
    }
    html.push(' ' + schedule.title);
  }

  return html.join('');
}

function getGridTitleTemplate(type) {
  var title = '';

  switch (type) {
    case 'milestone':
      title = '<span class="tui-full-calendar-left-content">MILESTONE</span>';
      break;
    case 'task':
      title = '<span class="tui-full-calendar-left-content">TASK</span>';
      break;
    case 'allday':
      title = '<span class="tui-full-calendar-left-content">ALL DAY</span>';
      break;
  }

  return title;
}

function getGridCategoryTemplate(category, schedule) {
  var tpl;

  switch (category) {
    case 'milestone':
      tpl = '<span class="calendar-font-icon ic-milestone-b"></span> <span style="background-color: ' + schedule.bgColor + '">' + schedule.title + '</span>';
      break;
    case 'task':
      tpl = '#' + schedule.title;
      break;
    case 'allday':
      tpl = getTimeTemplate(schedule, true);
      break;
  }

  return tpl;
}

const templates = {
  monthDayname: function (dayname) {
    return '<span class="calendar-week-dayname-name">' + dayname.label + '</span>';
  },
  time: function (schedule) {
    return getTimeTemplate(schedule, false);
  },
  allday: function (schedule) {
    return getTimeTemplate(schedule, true);
  },
  alldayTitle: function () {
    return getGridTitleTemplate('allday');
  },
  allday: function (schedule) {
    /*
     * use another functions instead of 'schedule'
     * milestone: function() {...}
     * task: function() {...}
     * allday: function() {...}
    */

    return getGridCategoryTemplate(schedule.category, schedule);
  }
}

const calendar = () => {
  const calElement = document.getElementById('calendarPlant')
  if (calElement) {
    let myCal = new Calendar('#calendarPlant', {
      defaultView: 'month',
      month: {
        visibleWeeksCount: 5 // visible week count in monthly
      },
      isReadOnly: true,
      scheduleView: true,
      template: templates
    });
    const schedule = JSON.parse(calElement.dataset.schedule)
    myCal.createSchedules(schedule);
  };
}

export { calendar };
