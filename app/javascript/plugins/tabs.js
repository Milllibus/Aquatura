const tab_opener = () => {
  const tabs = document.querySelectorAll(".tablinks");
  const contents = document.querySelectorAll('.tabcontent');
  tabs.forEach(tab => {
    tab.addEventListener('click', event => {
      contents.forEach(content => {
        if (content.id === event.currentTarget.dataset.tab) {
          content.classList.add('active');
          event.currentTarget.classList.add('active-btn');
          // tabs.forEach(tab => {
          //   if (content.className !== event.currentTarget.innerText) {
          //     tab.classList.remove('active-btn');
          //   };
          // });
        } else {
          content.classList.remove('active');
          document.querySelector(`button.tablinks[data-tab="${content.id}"]`).classList.remove('active-btn');
        };
      });
    });
  });
};

export { tab_opener };
