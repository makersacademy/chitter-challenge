INSTRUCTIONS:

```
$ git clone https://github.com/tansaku/chitter_challenge
$ bundle
$ createdb chitter_development
$ rake auto_migrate
$ rspec
$ rackup
```

ABOUT:		

The challenge is to build a Twitter clone as part of the Makers Academy course.

USER STORIES:

```sh
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

MY APPROACH:

I decided I wanted to extend functionality first and foremost before adding any front end design.

Sometimes the messages can be a bit zany and chatty - partly because that's what Makers is like.

The app is test driven with Capybara and Rspec.
The app uses Sinatra/Base and the modular style.

Unfortunately, the modular style can sometimes interact oddly with Rspec and Capybara, thus refactoring to a multiple-controller and central server setup is WIP and awaiting response form

FUNCTIONALITY, SCREEN SHOTS AND USAGE:

* Makers can sign up, sign in and log out.

```
![Screenshot](https://path_to_your_image)
```


* You cannot sign up if your username or password is not unique in the Postgresql database.

```
![Screenshot](https://path_to_your_image)
```


* You cannot sign in if your password doesn't match the one you signed up with.

```
![Screenshot](https://path_to_your_image)
```


* Passwords are encrypted with Bcrypt

* Non-Makers can see all users' peeps on the Chitter HQ page, but only site members can post peeps.

```
![Screenshot](https://path_to_your_image)
```


* Peeps are displayed in reverse chronological order and are stamped with the date, time and author of the peep.  

```
![Screenshot](https://path_to_your_image)
```


TO DO

1. Understand how to get Sinatra and Rspec to work together in the modular style. Currently Rspec fires up Sinatra in the command line, and, when this is rectified, I cannot rackup the localhost site.

2. Further User stories

3.
FURTHER USER STORIES

```sh
As a Maker
So that I can find out what my friends are up to easily
I want to be able to filter peeps by a username search

As a Maker
So that I can show people what I\'ve been up to
I want to be able to include photos in peeps.

As a Maker
So that I can get to know other people faster
I want to be able to write a short bio as a footer to all my peeps.

As a Maker
So that people can recognise me
I want to be able to have a profile picture.

As a maker
So that I can navigate conversations quickly
I want to be able to search by hashtags.

As a maker
So that I never get locked out of my account
I want to be able to request a email recovery message.

```






PROJECT CONTENTS:


      Gemfile
			Gemfile.lock
			Rakefile
			README.md - a description of the challenge set by MakersAcademy
      README_FROM_AUTHOR.md - my readme

      app directory
      app.rb
      config.ru
      data_mapper_setup.rb
      helpers.rb - to keep the controller skinnier, I have made a module of helper methods.
        controllers
          currently empty, but WIP to get Sinatra to co-operate with refactor.
        models
          peep.rb
          user.rb
        public
          Will evenutally contain CSS style sheets
        views
          index.erb - contains sign up and sign in forms
          welcome.erb - contains a welcome message for new and old users
          logout.erb - is a sinatra/partial so that a logout option can be included anywhere on the site easily
        session.erb - the main messageboard view
			spec directory
				feature_spec directory
          peeps_feature_spec.rb
          signin_feature_spec.rb
          Signout_feature_spec.rb
        spec_helper.rb
        web_helper.rb
      WIP
        This file contains snippets of code I am working on, including an attempt to refactor to a multiple controller set up.


LICENSE:	This project is licensed under the terms of the MIT license.
		see LICENSE.md

AUTHORS: 	Viola Crellin
CONTACT: 	viola.crellin@gmail.com
