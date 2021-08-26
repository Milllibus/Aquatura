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
    console.log(schedule);
    myCal.createSchedules(schedule);
    // myCal.createSchedules([
    //   {"id":1,"calendarId":"1","title":"Micheal Dare IV schedule","category":"time","start":"2021-08-28T00:00:00+02:00"},
    //   {"id":2,"calendarId":"1","title":"Micheal Dare IV schedule","category":"time","start":"2021-08-26T00:00:00+02:00"}])
    // const watering_history = JSON.parse(calElement.dataset.history)
    // watering_history.forEach((date) => {
    //   myCal.createSchedules([date]);
    // });
  };
}



export { calendar };
