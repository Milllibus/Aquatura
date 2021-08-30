
const weather = (query) => {

  fetch(`https://api.openweathermap.org/data/2.5/weather?q=marseille&appid=3a84afc0cbb1319754a397547de8202e&units=metric`)
    .then(response => response.json())
    .then((data) => {
      console.log(data);
      });
};

export { weather };
