# Chitter

## Makers Academy weekend challenge #4

### Features

- Users can post messages ("Peeps") to Chitter, which all show up on the homepage
- Users can only post a message if they are logged in
- Users sign up with a username, email, name and password; if the username or email are not unique, their account is not created and they see an error message
- Messages are displayed in reverse chronological order, and include the time the message was posted, along with the name and username of the user


### How to run locally in your browser

- Clone and `cd` into this repo
- `$ bundle install`
- `$ rspec` to run the tests
- `$ rackup -p 4567` to launch
- Visit `localhost:4567` in your browser after launching
- Click "sign up", and fill in the form (all fields are required)
- Click "Post new peep" to begin writing a message


### Technologies used

- Written in Ruby 2.4.0 with Sinatra
- Tested with Capybara and Rspec
- DataMapper gem used for storing information in the database
- BCrypt gem used for encrypting passwords


### Future

Given more time I would have liked to implement an email notification feature (although admittedly I have no idea how to even start on that), and also improve the error message upon failing to create an account.  DataMapper stores the errors that occur on each property, but storing this data in the session to be able to display it after redirecting proved very challenging, so at the moment the user has no way of seeing whether the username or the email address is the problem.  I would also have liked to use CSS to make the page more attractive, but functionality was my priority.
