document.addEventListener('turbolinks:load', function () {
    var timer = document.querySelector('.timer');

    if (timer) {
        var timerTime = timer.dataset.timer;

        setInterval(function () {
            if (timerTime > 0) {
                timerTime--;
            }

            else {
                alert('Время вышло!');
                document.querySelector('form').submit();
            }

            timer.innerHTML = parseInt(timerTime / 60) + ':' + (timerTime % 60 ? timerTime % 60 : '00');
        }, 1000);
    }
});
