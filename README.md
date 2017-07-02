Chitter Challenge
==================


![id](https://raw.githubusercontent.com/Corina/chitter-challenge/master/public/Screen%20Shot.png)


Chitter is a web app where users can post short messages and view messages posted by other people. In order to be able to post you need to create an account. The home page lists all *peeps* created up until now, in reverse chronological order, including user and timestamp for each *peep*.

In order to create an account you have to specify email, password, user name and name, with email and user name restricted to unique values.

Style elements were added using Bootstrap framework.

Features:
-------

```
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
```
************************************************************
###### Example of how signup form errors are generated:

```ruby
<% if @errors %>
  <% @errors.each do |field_errors| %>
    <% field_errors.each do |error| %>
      <div class="alert alert-warning" role="alert"><%= error %> </div>
    <% end %>
  <% end %>
<% end %>
```

#### How to install it
- Clone this repo by running: `$ git clone https://github.com/Corina/chitter-challenge.git`
- Run 'bundle install' in the project directory to ensure you have all the gems

#### Extra functionality to be added
- Login and logout funtionality

#### How to test it
- Use capybara/rspec, run command $ rspec
