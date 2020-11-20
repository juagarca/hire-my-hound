const changeToConfirm = () => {

  const buttons = document.querySelectorAll('.confirm');

  buttons.forEach((button) => {
    button.addEventListener('click', (event) => {
    console.log(event.currentTarget.innerHTML);

    button.innerHTML = "Confirmed!";
    button.classList.remove("confirm");
    button.classList.add("confirmed");
    });
  });
}

export { changeToConfirm };
