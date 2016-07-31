# **Chitter Challenge**

https://chitter-demo.herokuapp.com/

Made as the weekend challenge for my fourth week studying with Makers' Academy, this is a Twitter inspired web app that allows users to create an account and then view and post short messages.<br>
It's development made use of the **Sinatra** framework for routing HTTP requests and the **Capybara** testing suite for running feature tests, with Sinatra providing a lightweight and flexible interface layer to the Rack middleware used. **PostgreSQL** was then used to provide database support for test, development and production environments. The Datamapper gem was used to create an **Object Relational Map** betweeen classes and tables as well as properties and corresponding columns in the table. It also allowed the creation of database constraints and easily rebuilding the table when neccessary. This consolidated the learnings around constructing database schemas and using them within a many to many relationship. Password security was provided by the BCrypt gem which created hash digests for storing in the table to avoid the case of storing actual user passwords, and so validating future logins against the digest key instead.<br>
I then took a little time to style the home and login pages with CSS, this introduced a non-semantic div tag which I would like to avoid in the future by learning more about using **flexbox**.<br>
Finally a PostgreSQL server was instantiated on **Heroku** and the site deployed there, https://chitter-demo.herokuapp.com/
<br><br>
The following User Stories were provided by Makers' Academy as a starting point for the weekend.

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

## **Usage**

If you have PostgreSQL installed the following commands can be employed to run and the test the site locally  :

    $ git clone https://github.com/benjamin-white/chitter_challenge
    $ bundle
    $ service postgresql start
    $ createdb chitter_development
    $ rake auto_migrate
    $ ruby app.rb

## **Some Screenshots**

![Screenshot](https://dl.dropboxusercontent.com/u/81396324/Chitter_ss_001.jpg)

![Screenshot](https://dl.dropboxusercontent.com/u/81396324/Chitter_ss_02.jpg)

![Screenshot](https://dl.dropboxusercontent.com/u/81396324/Chitter_ss_03.jpg)

## **Future Features**

* Extract the CSS into a Sinatra _public_ folder.
* Provision a mechanism for users to reset passwords.
* Provision a mechanism for users to delete posts.
* Provision a mechanism to search for posts by user.
* Use **Foundation** icons to enhance visual wayfinding.
* Replace fixed CSS sizes with EMs and add stylesheet breakpoints.
