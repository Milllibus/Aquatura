import Calendar from 'tui-calendar';
import "tui-calendar/dist/tui-calendar.css";

const calendar = () => {
  if (document.getElementById('calendar')) {
    const plantCalendar = new Calendar('#calendar', {
      defaultView: 'month',
      isReadOnly: true,
      template: {
        monthDayname: function (dayname) {
          return '<span class="calendar-week-dayname-name">' + dayname.label + '</span>';
        }
    }
    });
    console.log(plantCalendar);
  }
}



export { calendar };
