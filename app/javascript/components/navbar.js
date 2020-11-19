const initUpdateNavbarOnScroll = () => {

  const navbar = document.querySelector('.navbar');

  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 1 ) {
        navbar.classList.add('navbar-gray');
      } else {
        navbar.classList.remove('navbar-gray');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
