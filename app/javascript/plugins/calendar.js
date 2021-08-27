import Calendar from 'tui-calendar';


const calendar = () => {
  const calElement = document.getElementById('calendarPlant')
  if (calElement) {
    let myCal = new Calendar('#calendarPlant', {
      defaultView: 'month',
      month: {
        visibleWeeksCount: 5 // visible week count in monthly
      },
      isReadOnly: true,
      template: {
        monthDayname: function (dayname) {
          return '<span class="calendar-week-dayname-name">' + dayname.label + '</span>';
        }
      }
    });
    const schedule = JSON.parse(calElement.dataset.schedule)
    myCal.createSchedules(schedule);
  };
}

export { calendar };
