Chitter is a Twitter clone written in Ruby. Users can create an account, log in with those details, and then post a Peep message. All users Peep messages are displayed in the homepage in reverse chronological order. If a user is tagged '@Username' in a Peep then that user is sent an email telling them they have been tagged.

Uses Sinatra, Rackup, Activerecord, PG, Sendgrid.

## SETUP

$ git clone https://github.com/zacmosshk/chitter_challenge
$ bundle
$ rake setup
$ rake migrate
$ rspec
$ rackup

Here are all the gems necessary for this:

group :test do
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

gem "sinatra", "~> 2.2"
gem "sinatra-contrib", "~> 2.2"
gem "webrick", "~> 1.7"
gem "rack-test", "~> 2.0"
gem "pg", "~> 1.4"
gem "activerecord", "~> 7.0"
gem 'sendgrid-ruby'

Sendgrid is a library that allows emails to be sent by a script in Ruby.

Sendgrid setup:

1. Go to https://www.twilio.com/sendgrid/email-api
2. Sign up for a free account
3. Verify an email - this will be your 'FROM' address
4. Navigate to https://app.sendgrid.com/guide/integrate/langs/ruby
5. Create an API key
6. Run the following code:

  Where
    YOUR_API_KEY = your Sendgrid API key
    YOUR_FROM_EMAIL = your verified email FROM address
    YOUR_TO_EMAIL = a second email address for testing

  $ echo "export SENDGRID_API_KEY='YOUR_API_KEY'" > sendgrid.env
  $ echo "export FROM_EMAIL='YOUR_FROM_EMAIL'" > sendgrid.env
  $ echo "export TO_EMAIL='YOUR_TO_EMAIL'" > sendgrid.env
  $ echo "sendgrid.env" >> .gitignore
  $ source ./sendgrid.env

Run source ./sendgrid.env every time you want to update sendgrid.env

If you get the following error:

```
Failure/Error: from = Email.new(email: @from)
     
     ArgumentError:
       email () is invalid
```

Then the ENV variables have not loaded correctly. Source the env file again and this should solve that problem.