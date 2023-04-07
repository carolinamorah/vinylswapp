window.addEventListener('scroll', function() {
    var nav = document.getElementById('mainNav');
        if (window.pageYOffset >= nav.offsetTop) {
            nav.classList.add('fixed-top');
        } else {
            nav.classList.remove('fixed-top');
        }
        if (window.pageYOffset <= nav.offsetTop) {
            nav.classList.remove('fixed-top');
        }
});






