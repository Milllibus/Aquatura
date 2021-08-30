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
  allday: function (schedule) {
    return getTimeTemplate(schedule, true);
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

const calNavigation = (cal) => {
  const todayElement = document.querySelector("[data-action='move-today']");
  const prevElement = document.querySelector("[data-action='move-prev']");
  const nextElement = document.querySelector("[data-action='move-next']");
  todayElement.addEventListener('click', (e) => {
    cal.today();
    e.currentTarget.classList.add('cal-active');
    prevElement.classList.remove('cal-active');
    nextElement.classList.remove('cal-active');
  })
  prevElement.addEventListener('click', (e) => {
    cal.prev();
    e.currentTarget.classList.add('cal-active');
    todayElement.classList.remove('cal-active');
    nextElement.classList.remove('cal-active');
  })
  nextElement.addEventListener('click', (e) => {
    cal.next();
    e.currentTarget.classList.add('cal-active');
    prevElement.classList.remove('cal-active');
    todayElement.classList.remove('cal-active');
  })
}


const calendar = () => {
  const calElement = document.getElementById('calendarPlant');
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
    const calendarTab = document.getElementById('calendar-btn');
    const todayElement = document.querySelector("[data-action='move-today']");
    calendarTab.addEventListener('click', () => {
      myCal.today();
      todayElement.classList.add('cal-active');
    })
    calNavigation(myCal);
  };
}

const generalCalendar = () => {
  const calElement = document.getElementById('general-calendar');
  if (calElement) {
    let generalCal = new Calendar('#general-calendar', {
      defaultView: 'month',
      month: {
        visibleWeeksCount: 5 // visible week count in monthly
      },
      isReadOnly: true,
      scheduleView: true,
      template: templates
    });
    const generalSchedule = JSON.parse(calElement.dataset.generalSchedule);
    generalCal.createSchedules(generalSchedule);
    calNavigation(generalCal);
  }
}

export { calendar, generalCalendar };
