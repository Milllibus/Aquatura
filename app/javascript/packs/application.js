// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "tui-calendar/dist/tui-calendar.css";
import 'tui-date-picker/dist/tui-date-picker.css';
import 'tui-time-picker/dist/tui-time-picker.css';

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { navMenu } from "../plugins/navbar_menu"
import { bottomMenu } from "../plugins/bottom_menu"
import { tab_opener } from "../plugins/tabs"
import { weather } from '../plugins/weather'
import { calendar, generalCalendar } from "../plugins/calendar"
import { initSweetalert } from '../plugins/init_sweetalert';

document.addEventListener('turbolinks:load', () => {
  bottomMenu();
  navMenu();
  tab_opener();
  calendar();
  weather();
  generalCalendar();
});


initSweetalert('#user-message', {
  title: "Sickening, no?!",
  icon: "success"
});

import "controllers"
