const tab_opener = () => {
  const tabs = document.querySelectorAll(".tablinks");
  if (tabs) {
    tabs.forEach(tab => {
      tab.addEventListener('click', event => {
        console.log('salut');
      });
    });
  }

}

export { tab_opener };
