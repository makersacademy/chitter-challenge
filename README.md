#Chitter Challenge

##Installation
With the project directory stored locally, run the following in your command line to set up the required gem dependencies:
`$ bundle`

If you do not already have bundler installed, you will need to install this first:
`$ gem install bundler`

##Setting up your database
This README assumes that the user has a working installation of PostgresQL installed
- Open your postgres terminal with `$ psql`
- You will then need to create both a development & test database for the application & test suite to use. This can be effected using the following commands:
```
# CREATE DATABASE chitter_development;
# CREATE DATABASE chitter_test;
\q
```

##Getting started
To run the application locally, run the following in the command line:
`$ rackup`
You should see something similar to this if this is successful:
```ruby
UpstatePedro$ rackup
[2015-08-17 01:59:03] INFO  WEBrick 1.3.1
[2015-08-17 01:59:03] INFO  ruby 2.2.2 (2015-04-13) [x86_64-darwin14]
[2015-08-17 01:59:03] INFO  WEBrick::HTTPServer#start: pid=22878 port=9292
```
You Chitter application is now live!

##Guidelines
- You must have an account to post a peep
- You cannot open an account without providing an email, name, and username
- Each email address can be used for one account only

##Features
```
As a Maker
So that I can post messages on Chitter as me
I want to sign up for Chitter
```
- [x] story 1

```
As a Maker
So that I can post messages on Chitter as me
I want to log in to Chitter
```
- [x] story 2

```
As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```
- [x] story 3

```
As a maker
So that I can let people know what I am doing
I want to post a message (peep) to chitter
```
- [x] story 4

```
As a maker
So that I can see what others are saying
I want to see all peeps in reverse chronological order
```
- [x] story 5

```
As a maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```
- [x] story 6
