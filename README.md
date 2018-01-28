Chitter-Twitter
=================
This was the mock of the Twitter website. The aim of this project was to bring together my knowledge of Ruby, RSpec, Capybara, Sinatra, HTML, SQL, Postgres, DataMapper(ORM) and finally Heroku.

You can visit the app here [Link](https://chitter--twitter.herokuapp.com)

I also learnt about a number of new Ruby gems such as 'orderly' and 'timecop' which helped me with my RSpec testing. Gem 'timecop' was particularly helpful as it allowed me to freeze testing for a set amount of time. This helped when I was testing the reverse chronological order of each peep/tweet.

-------
## Using the app

RUBY VERSION ruby 2.4.1       
BUNDLED WITH 1.16.1

Open your terminal and type in the following and press enter;

```
$ git clone https://github.com/bpourian/chitter-challenge.git
```
Change directories to the the chitter-challenge
```
$ cd chitter-challenge
```
Make sure you run bundle install
```
$ bundle install
```
Finally rackup and to run the local server
```
$ rackup
```
Once the server is running you can enter the following in any browser
```
$ http://localhost:9292/
```

-------
##User story that I followed

```
STRAIGHT UP

As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter

HARDER

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a Maker
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep
```
