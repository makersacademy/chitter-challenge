Chitter Challenge
=================

https://fast-gorge-43523.herokuapp.com

Approach
-------

My initial aim was to create a fully functional & responsive app (ambitious).
I started by implementing the basic logic, so as to achieve an MVP as soon as possible.
Once I had an MVP, I then switch to focus on the front end, to make it look nice (though without using responsive design).
After, I then returned to the application logic, adding features such as tagging & replying to peeps.

It is mostly complete, though still requires work on the following:

* Flash notices & welcome/goodbye messages (they're currently hidden)
* Tests can be tidied up and refactored quite a bit
* controllers & more partials can be extracted out into separate files
* Add responsiveness to the design

Desired features that I didn't get round to:

* Email feature (the tagging is set up, but currently serving no additional purpose).
* Click-through a user's handle to see their peeps.

Technologies
-------
* Heroku for hosting
* Sinatra for the back end
* PostgreSQL for the database
* HTML & CSS for the front end
* tests written in RSpec & Capybara