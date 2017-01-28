# Chitter Challenge
### [Makers Academy] (http://www.makersacademy.com) - Week 4 Solo Weekend Project

## Index
* [Gems Used] (#GEMS)
* [Installtion] (#Install)
* [User Stories] (#US)
* [Usage] (#Usage)
* [Screen Shots] (#Shots)
* [Use live on Heroku] (#Heroku)

## <a name="GEMS">Gems Used</a>
```ruby
gem 'data_mapper'
gem 'dm-postgres-adapter'
gem 'sinatra'
gem 'sinatra-partial'
gem 'rake'
gem 'bcrypt'
gem 'sinatra-flash'

group :test do
  gem 'cucumber'
  gem 'byebug'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'rspec'
  gem 'rspec-sinatra'
  gem 'selenium-webdriver'
  gem 'timecop'
  gem 'coveralls', require: false
end
```

## <a name="Install">Installation</a>
The Chitter Challenge is ran on Ruby version : 2.3.3

* To clone and change Ruby versions
```shell
$ git clone https://github.com/adrianeyre/chitter-challenge
$ cd chitter-challenge
$ rvm 2.3.3
```
* To install Ruby 2.3.3
```shell
$ rvm install ruby-2.3.3
```
* To install Gems
```shell
$ gem install bundle
$ bundle
```

## <a name="US">User Stories</a>
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

## <a name="Usage">Usage</a>
To load Sinatra web server
```shell
$ rackup -p 4567
```
type `http://localhost:4567` into your web browser

## <a name="Heroku">Use live on Heroku</a>

[Chitter] (https://adrianeyre-chitter.herokuapp.com)

## <a name="Shots">Screen Shots</a>
### Main Chitter Screen
[![ScreenShot1](https://raw.githubusercontent.com/adrianeyre/chitter-challenge/master/images/screenshot1.png)](https://raw.githubusercontent.com/adrianeyre/chitter-challenge/master/images/screenshot1.png "Screen Shot 1")

### Sign Up Screen
[![ScreenShot1](https://raw.githubusercontent.com/adrianeyre/chitter-challenge/master/images/screenshot2.png)](https://raw.githubusercontent.com/adrianeyre/chitter-challenge/master/images/screenshot2.png "Screen Shot 2")

### Sign In Screen
[![ScreenShot1](https://raw.githubusercontent.com/adrianeyre/chitter-challenge/master/images/screenshot3.png)](https://raw.githubusercontent.com/adrianeyre/chitter-challenge/master/images/screenshot3.png "Screen Shot 3")
