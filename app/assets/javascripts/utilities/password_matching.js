document.addEventListener('turbolinks:load', function() {
    var control = document.querySelector('#new_user');
    if (control) {control.addEventListener('input', passwordMatching)}
});

function passwordMatching() {
    var password = document.querySelector('#user_password');
    var passwordConfirmation = document.querySelector('#user_password_confirmation');
    var icon1 = document.querySelector('.octicon-check');
    var icon2 = document.querySelector('.octicon-x');

    if (passwordConfirmation.value === '') {
        icon2.classList.remove('hide');
        icon1.classList.add('hide');
    } else if (password.value === passwordConfirmation.value) {
        icon1.classList.remove('hide');
        icon2.classList.add('hide');
    } else {
        icon2.classList.remove('hide');
        icon1.classList.add('hide');
    }
}
