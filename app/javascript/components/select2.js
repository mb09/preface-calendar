import select2 from 'select2';

const initSelect2 = () =>{
  console.log($(".subjectSelect2").val());
  $(".subjectSelect2").select2({
    tags: true,
    placeholder: "Select multiple subjects."
  });
}

export {initSelect2};
