const tab_opener = () => {
  const tabs = document.querySelectorAll(".tablinks");
  const contents = document.querySelectorAll('.tabcontent');
  tabs.forEach(tab => {
    tab.addEventListener('click', event => {
      contents.forEach(content => {
        if (content.id === event.currentTarget.innerText) {
          content.classList.add('active');
         } else {
          content.classList.remove('active');
         }
      })
    })
  })
}

export { tab_opener };
