const navMenu = () => {
  const menuToggle = document.querySelector('#nav__toggle');
  const menuDiv = document.querySelector('#menu');

  if ( menuToggle && menuDiv ) {
    menuToggle.addEventListener('click', e => {
      e.preventDefault();
      menuDiv.classList.toggle('hidden');
      e.currentTarget.classList.toggle('rotate');
    });
  }
}

export { navMenu };
