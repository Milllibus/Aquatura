import swal from 'sweetalert';

const initSweetalert = (selector, options = {}) => {
  const swalButton = document.querySelector(selector)
  if (swalButton) {
    options.text = swalButton.dataset.content
    swal(options);
  }
};

export { initSweetalert };
