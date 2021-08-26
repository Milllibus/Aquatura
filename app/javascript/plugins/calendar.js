import Calendar from 'tui-calendar';
import "tui-calendar/dist/tui-calendar.css";

const calendar = () => {
  const calElement = document.getElementById('calendarPlant')
  if (calElement) {
    const myCal = new Calendar('#calendarPlant', {
      defaultView: 'month',
      isReadOnly: true,
      template: {
        monthDayname: function (dayname) {
          return '<span class="calendar-week-dayname-name">' + dayname.label + '</span>';
        }
      }
    });
    const schedule = JSON.parse(calElement.dataset.schedule)
    schedule.forEach((date) => {
      myCal.createSchedules([date])
    });
  }
}



export { calendar };
