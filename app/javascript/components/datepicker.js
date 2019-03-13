import flatpickr from 'flatpickr';

const initDatePicker = () =>{

  flatpickr(".timePicker", {
    altInput: true,
    enableTime: true,
    noCalendar: true,
    dateFormat: "H:i"
  })
}

export {initDatePicker};
