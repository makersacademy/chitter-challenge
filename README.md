Chitter Challenge
=================



What is Chitter?
-------

For the fifth weekend challenge at Maker's Academy, we have been asked to build a full-stack application that simulates the core functionality of Twitter. A publicly visibly feed will display all 'peeps' from users, who in turn can sign up, post 'peeps', log in and log out of the app.

Technologies:
-------
* Ruby Sinatra
* DataMapper & Postgres
* BCrypt - password encryption
* Heroku - production
* Rspec - Unit Testing
* Capybara - Feature Testing

How to use Chitter:
-------
Visit the production app on Heroku here: https://annalaise-chitter.herokuapp.com/

For Testing:

*Step 1 - Clone the Repo*
Open Terminal
Navigate to a directory where you would like this repo to be stored
enter the following:
```
git clone git@github.com:annalaise/chitter-challenge.git
```

*Step 2 - Install Gems*

```
gem install bundler
bundle
bundle update
```

*Step 3 - Install PSQL (if you do not have this installed already)*
```
brew install postgresql
```
After homebrew has downloaded the software it will show you some installation instructions, follow them!
Make sure you run these commands after installing:
```
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
```
Then create a database so that you can log in without having to specify which one: `psql postgres`

Which opens up the postgres terminal - it looks something like `postgres=#`

Then type in the following:

```
create database "your_user_name_here";

CREATE DATABASE

postgres=# \q
```
The last command quits out of the postgres terminal.

From now on you will be able to log in to postgresql without having to specify the database you want to log into.

*Step 4 - Create Databases*
```
psql
CREATE DATABASE chitter_development;
CREATE DATABASE chiter_test;
```
Check both databases have been setup by entering `\l` while still in psql - this will list the databases on your local host. Enter `\q` to exit psql once done.

*Step 5 - Run Tests*

Run `rspec` for checking tests pass

Run `rackup`, navigate to your chosen client browser and visit `localhost:9292` (or the PORT number specified in rackup logs) to see the app working locally. 
