#Chitter Challenge
=================

##Partial Solution
###Things to add when I have additional time:

* Figure out how to effectively incorporate BCrypt and encrypting passwords
* Ammend bug where a new user must log in before "peeping"
* Adding email notifations when tagged
* Add ability to reply to peeps
* Figure out how to add CSS styles in ruby
* Figure out how to get Sinatra Flash working correctly

##Technologies used

*Sinatra
*Rack Test
*RSpec
*PostrgeSQL

##Setup Instructions

```
$ git clone https://github.com/iniffur/chitter_challenge
$ gem install bundler
$ bundle install
$ rake db:migrate
$ rspec
$ rerun 'rackup'
```


