import select2 from 'select2';

const initSelect2 = () =>{
  $(".subjectSelect2").select2({
    tags: true,
    placeholder: "Select multiple subjects."
  });
}

export {initSelect2};
