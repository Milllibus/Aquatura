const weather = () => {

  const temperature = document.querySelector('#temperature');
  const description = document.querySelector('#description');
  const icon = document.querySelector('#icon');
  const city = document.querySelector('#city');

  const advices = [
    {
      min: 0,
      max: 10,
      advice: "put your plants in th fire"
    },
    {
      min: 10,
      max: 25,
      advice: "lidjkjdvf"
    },
    {
      min: 25,
      max: 100,
      advice: "loijljkl"
    },
  ]
  const updateCard = (data) => {
    description.innerText = data.weather[0].description;
    const tempCelcius = Math.round(data.main.temp);
    temperature.innerText = `${tempCelcius}°C`;
    icon.src = `https://openweathermap.org/img/w/${data.weather[0].icon}.png`;
    city.innerText = data.name;
    // get the advice depending on temp
    console.log(tempCelcius);
    const adviceTodisplay = advices.find((adviceObj) => {return 102 >= adviceObj.min && 102 < adviceObj.max })?.advice;
    console.log(adviceTodisplay);
  };

  navigator.geolocation.getCurrentPosition((data) => {
    const url = `https://api.openweathermap.org/data/2.5/weather?lat=${data.coords.latitude}&lon=${data.coords.longitude}&appid=3a84afc0cbb1319754a397547de8202e&units=metric`
    fetch(url)
      .then(response => response.json())
      .then(updateCard);

  });



}
export { weather };
