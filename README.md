#Chitter Challenge: Makers Weekend Challenge 4
=================
```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

## How to run

- Clone this repo to your local machine `git clone [url]`
- Navigate to the `chitter-challenge` folder `cd rps-challenge`
- Run `gem install bundle` if bundler isn't installed & run `bundle`
- On your terminal, run `rackup` to launch the web app
- Enter `localhost:9292` in the address bar of a web browser
- Sign up, view peeps and post peeps

## Tools/Languages

- Sinatra
- Capybara
- Ruby v 2.3.1
- rspec
- Postgres SQL databases
- DataMapper
- Rake

## Limitations

- Multiple people can sign up to use Chitter with the same name, etc. I would prevent this in future.
- Styling for Chitter leaves much to be desired.
- Users cannot interact with one another. I would like to bring in this functionality.
- Passwords may be entered incorrectly, which is not ideal for privacy.
- Users cannot post unless they are logged in, but the app does not currently make this clear. They are directed to the log in page again.
