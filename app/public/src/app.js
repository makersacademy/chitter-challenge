TweenMax.from('section#sign_in', 1, {opacity:0, scale:0, ease:Power1.easeOut, delay:0.2});
TweenMax.to('section#sign_in', 1, { opacity:1, delay:0.2 });

TweenMax.staggerFrom('.user_text', 0.5, {opacity:0, y:300, delay:0.5}, 0.2);
TweenMax.staggerTo('.user_text', 1, { opacity:1, delay:0.5 }, 0.2);
