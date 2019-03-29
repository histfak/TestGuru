document.addEventListener('turbolinks:load', function () {
    var timer = document.querySelector('.timer');

    if (timer) {
        var timerTime = timer.dataset.timer;
        var testPassageId = timer.dataset.testPassageId;

        setInterval(function () {
            if (timerTime > 0) {
                timerTime--;
            }

            else {
                alert('Время вышло!');
                window.location.replace('/test_passages/' + testPassageId + '/result');
            }

            timer.innerHTML = parseInt(timerTime / 60) + ':' + (timerTime % 60 ? timerTime % 60 : '00');
        }, 1000);
    }
});
