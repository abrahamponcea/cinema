let header = document.querySelector('header');
let menu = document.querySelector('#meu-icon');
let navbar = document.querySelector('.navbar');

window.addEventListener('scroll', () =>{
    header.classList.toggle('shadow', window.scrollY > 0);
});

var swiper = new Swiper(".home", {
    spaceBetween: 30,
    centeredSlides: true,
    autoplay: {
      delay: 5000,
      disableOnInteraction: false,
    },
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
  });