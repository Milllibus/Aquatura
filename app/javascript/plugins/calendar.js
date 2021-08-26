import Calendar from 'tui-calendar';
import "tui-calendar/dist/tui-calendar.css";

const calendar = () => {
  if (document.getElementById('calendarPlant')) {
    new Calendar('#calendarPlant', {
      defaultView: 'month',
      isReadOnly: true,
      template: {
        monthDayname: function (dayname) {
          return '<span class="calendar-week-dayname-name">' + dayname.label + '</span>';
        }
      }
    });
  }
}



export { calendar };
