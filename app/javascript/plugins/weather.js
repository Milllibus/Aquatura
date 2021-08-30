const weather = () => {

  const temperature = document.querySelector('#temperature');
  const description = document.querySelector('#description');
  const icon = document.querySelector('#icon');
  const city = document.querySelector('#city');

  const updateCard = (data) => {
    description.innerText = data.weather[0].description;
    temperature.innerText = `${Math.round(data.main.temp)}°C`;
    icon.src = `https://openweathermap.org/img/w/${data.weather[0].icon}.png`;
    city.innerText = data.name;
  };

  navigator.geolocation.getCurrentPosition((data) => {
    const url = `https://api.openweathermap.org/data/2.5/weather?lat=${data.coords.latitude}&lon=${data.coords.longitude}&appid=3a84afc0cbb1319754a397547de8202e&units=metric`
    fetch(url)
      .then(response => response.json())
      .then(updateCard);

  });



}
export { weather };
