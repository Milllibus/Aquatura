const weather = () => {
  const weatherElement = document.querySelector(".weather");
  if(weatherElement){
    const temperature = document.querySelector('#temperature');
    // const description = document.querySelector('#description');
    const icon = document.querySelector('#icon');
    const city = document.querySelector('#city');
    const adviceDisplay = document.querySelector('#advicedisplay');

    const advices = [
      {
        min: -20,
        max: 0,
        advice: "It's too cold, take care of your plants"
      },
      {
        min: 0,
        max: 10,
        advice: "It's cold, keep an eye on your plants"
      },
      {
        min: 30,
        max: 100,
        advice: "It's too hot, take care of your plants"
      },
    ]
    const updateCard = (data) => {
      // description.innerText = `${data.weather[0].description} in`;
      const tempCelcius = Math.round(data.main.temp);
      temperature.innerText = `${tempCelcius}°C`;
      icon.src = `https://openweathermap.org/img/w/${data.weather[0].icon}.png`;
      city.innerText = data.name;
      // get the advice depending on temp
      const adviceTodisplay = advices.find((adviceObj) => { return tempCelcius >= adviceObj.min && tempCelcius < adviceObj.max })?.advice;
      adviceTodisplay ? adviceDisplay.innerText = adviceTodisplay : "";
    };

    navigator.geolocation.getCurrentPosition((data) => {
      const url = `https://api.openweathermap.org/data/2.5/weather?lat=${data.coords.latitude}&lon=${data.coords.longitude}&appid=3a84afc0cbb1319754a397547de8202e&units=metric`
      fetch(url)
        .then(response => response.json())
        .then(updateCard);

    });

  }

}
export { weather };
