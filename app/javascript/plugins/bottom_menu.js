const bottomMenu = () => {
  document.addEventListener('scroll', (e) => {
    const menu = document.getElementById('button-menu');
    if (menu) {

      if (window.scrollY >= document.getElementById('nav').clientHeight) {
        menu.classList.remove("d-none")
      } else {
        menu.classList.add("d-none")
      }
    }
  })
}

export { bottomMenu }
