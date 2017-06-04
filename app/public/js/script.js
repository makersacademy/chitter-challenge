(function ($) {
    $.fn.extend({
        limiter: function (minLimit, maxLimit, elem) {
            $(this).on("keydown keyup focus keypress", function (e) {
                setCount(this, elem, e);
            });

            function setCount(src, elem, e) {
                var chars = src.value.length;
                if (chars == maxLimit) {
                    //e.preventDefault();
                    elem.html(maxLimit - chars);
                    elem.addClass('maxLimit');
                    return false;

                } else if (chars > maxLimit) {
                    src.value = src.value.substr(0, maxLimit);
                    chars = maxLimit;
                    elem.addClass('maxLimit');
                } else {
                    elem.removeClass('maxLimit');
                }
                if (chars < minLimit) {
                    elem.addClass('minLimit');
                } else {
                    elem.removeClass('minLimit');
                }
                elem.html(maxLimit - chars);
            }
            setCount($(this)[0], elem);
        }
    });
})(jQuery);

var elem = $("#chars");
$("#text").limiter(35, 100, elem);