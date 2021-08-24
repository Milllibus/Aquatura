const bottomMenu = () => {
  const menu = document.getElementById('button-menu');
  if (menu) {
    document.addEventListener('scroll', (e) => {
      // console.log(document.getElementById('nav').clientHeight);
      if (window.scrollY >= document.getElementById('nav').clientHeight) {
         menu.classList.remove("d-none")
       }
      else {
        menu.classList.add("d-none")
      }
    })
  }

}

export { bottomMenu }
