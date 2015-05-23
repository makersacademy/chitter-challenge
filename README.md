# Chitter Challenge

## Demo

https://chitter-rodcul.herokuapp.com/

## Project Roadmap

* [x] README
* [x] Sinatra init
* [x] Bootrap
* [x] Heroku
* [x] Datamapper
* [x] Rspec/Capybara/Cucumber (websteps!)
* [x] Sign up
* [x] Login
* [x] Logout
* [x] Post message
* [x] See messages
* [x] See time
* [x] Reply message (optional)
* [ ] Reply > Login > Reply directly to original peep
* [ ] User profile page with list of peeps
* [ ] #hashtag page with list of peeps
* [ ] Clickable usernames & hashtags
* [ ] Breakout templates into partials
* [ ] Allow posting of html tags (currently renders them)
* [ ] Forgotten password
* [ ] Logout inactive session

## Screenshot

![Screenshot](/public/img/screenshot.png)

## Features

```sh
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

Notes on implementation:
------

* Using rspec & capybara
* Did not include name, we prefer to remain anonymous
* Bootstrap for styling
