# Week 4: Chitter challenge

### Setup

I'm starting off by setting up the following:
..* Sinatra to create the web application
..* Capybara to allow testing of the web application
..* Selenium Webdriver allows the automation of the web browser
..* PostgreSQL for the database
..* Sinatra-Flash for any flash notifications

I will be setting up a database for the web app to connect to. It will initially take the bare minimum:
..* Name taken from params on the page
..* The "peep"
Later on I'll add a timestamp column.

I have also set up 2 databases, one for the app the the other for testing.

### Setting up the foundation

I will be starting by setting up the basic web app file.

In order to meet the MVP for the challenge, I want the entry box at the top. The box should record the name of the sender (which can be implemented later), the "peep" box, and the timestamp of when the user presses submit.

I want the "peeps" to pop up below the box in reverse chronological order below this box.

### Testing and implementing the first method: self.all

Most of the testing and implementation has been taken from the bookmark manager weekly. One change is how the environment variable works with rspec. Instead of checking the state of an active environment variable in the spec helper, I have taken up Patryk's implementation that stubs it to equal to the test database instead.

One challenge I came across while doing this was the understanding of how `PG.connect` works. I spent half an hour thinking that I got the implementation wrong when I actually didn't require the pg gem...
