Chitter Challenge
=================

Task:
-------

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

Technologies used
-----
1. ruby 2.5.0
2. sinatra
3. postgre sql
4. capybara

To use the progect, following gem files are required:
gem 'bcrypt'
gem 'pg'
gem 'rack-test'
gem 'rake'
gem 'shotgun'
gem 'sinatra'
gem 'sinatra-flash'
gem 'capybara'
gem 'pry'
gem 'rspec'

Clone the progect and type ```bundle install``` in terminal
To run tests, type ```rspec```


Result
-----

## Screen #1 ```/```
start screen:

<img src="https://monosnap.com/image/pYtevFxeJ0HG7uu4dwJOLVbsezfvJc.png" height="200" width="350" />

when log out:

<img src="https://monosnap.com/image/pYtevFxeJ0HG7uu4dwJOLVbsezfvJc.png" height="200" width="350" />

## Screen #2 ```/users/sign_up```
creating new user:

<img src="https://monosnap.com/image/XFSeUImkrnvCcNas08FiwfjCYzHKvJ.png" height="200" width="700" />

try to sign up with existing user:

<img src="https://monosnap.com/image/tODByO5MLLD62ycRO1ipybW8hEDATv.png" height="200" width="700" />

Error if user already exists:

<img src="https://monosnap.com/image/X3RfqKLarsXNAnTuXcwlTYrCPdEYgQ.png" height="200" width="700" />

## Screen #3 ```/posts```
<img src="https://monosnap.com/image/TNZFJoFvrWIORSIRPuxGxFus8wC5IH.png" height="200" width="350" />

send message:

<img src="https://monosnap.com/image/B8BMG9bgJPHq7bdg9aLc999b1Clw6a.png" height="200" width="350" />

delete message:

<img src="https://monosnap.com/image/ZLnRCc1Y6pSsRIPzKtDPlB8ruFDhQh.png" height="200" width="350" />

updated user name:

<img src="https://monosnap.com/image/jceuxO7CKO49TV53uWS9Zv9Hk8dB18.png" height="200" width="350" />


## Screen #4 ```/users/:id/update```
updated user name:
<img src="https://monosnap.com/image/xrSPeM1Q5Cs5gjay9HgXfy3Rka3p4L.png" height="200" width="700" />

## Screen #5 ```/users/log_in```
<img src="https://monosnap.com/image/0YxVVzHiwCvQPaJu88RjPXSorcQyjH.png" height="200" width="700" />
error if try log in with not existing user or mistakes in filling:
<img src="https://monosnap.com/image/FUnASsNqpMUyJuIgADz6yY9n0z1VxA.png" height="200" width="700" >
