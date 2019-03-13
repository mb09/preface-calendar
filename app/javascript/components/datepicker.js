import flatpickr from 'flatpickr';

const initDatePicker = () =>{

  flatpickr(".timePicker", {
    altInput: true,
    enableTime: true,
    noCalendar: true,
    dateFormat: "H:i",
    minTime: "10:00",
    maxTime: "19:00"
  })
}

export {initDatePicker};
