document.addEventListener('turbolinks:load', function() {
    var progressBar = document.querySelector('.progress-bar');

    if (progressBar) {
        var currentQuestion = progressBar.dataset.current;
        var allQuestions = progressBar.dataset.all;
        progressBar.style.width = (currentQuestion / allQuestions * 100) + '%';
    }
});
