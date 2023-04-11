<a name="readme-top"></a>

# _Chitter Challenge_

#### By _**Sidra Iqbal, adapted from Makers Academy**_

Technologies Used
-----

* Ruby
* CSS
* HTML
* Postgresql
* Sinatra

Description:
-------

This project is designed to mimic the popular 'Twitter' app for Makers student use. Chitter will have basic functionality like: creating peeps, viewing peeps (including the time of peep in chronological order), as well as login, sign-up and logout capabilities. 

The user should have visibility to the login and register links when they are not logged in and similarly only have visibility to the sign-out link when they are logged in, to give a positive user experience. 

[![Screenshot of main page](https://i.imgur.com/g3bzkKR.png)](https://chitter-app-59gf.onrender.com/){:target="_blank"}


Features:
-------

* Register: User can register to Chitter with their email and create an account with a username and password. 
* Login: User can login to their account from the homepage by entering their email address and password.
* Logout: User can logout from the homepage by clicking on the logout link. 
* New Peep: Logged in user can have the option to create a new peep by clicking the new peep link on the homepage, where they are directed to the /new_peep page and can submit a peep
* View Peeps: Irrespective of logged in status, peeps will be shown on the homepage in order of the most recent peep first. The peep contents and time are shown on the homepage.

Notes on functionality:
------

* You don't have to be logged in to see the peeps.
* Makers sign up to chitter with their email, password, name and a username (e.g. samm@makersacademy.com, password123, Sam Morgan, sjmog).
* The username and email are unique.
* Peeps (posts to chitter) have the name of the maker and their user handle.

Installation & Requirements
------

Clone the repo and add the relevant gems:

```
git clone https://github.com/siqbal181/chitter-challenge.git
gem install sinatra -v '~> 3.0'
gem install sinatra-contrib -v '~> 3.0'
gem install webrick -v '~> 1.8'
gem install rack-test -v '~> 2.1'
gem install bcrypt -v '~> 3.1.7'
gem install pg -v '~> 1.4'
```

Testing:
```ruby
gem 'rspec'
gem 'simplecov', require: false
gem 'simplecov-console', require: false
```

## Contact

Sidra Iqbal 

Project Link: [https://github.com/siqbal181/chitter-challenge](https://github.com/siqbal181/chitter-challenge)

<p align="right">(<a href="#readme-top">back to top</a>)</p>
