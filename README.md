Chitter Challenge
=================

This repo contains week 4's homework challenge. The task was to create a twitter clone that let users sign up to the website and post messages via their username and have the web page show all of the messages it had received.

This has been completed using Sinatra to host the server, Ruby to run the logic behind it and I've used the ORM DataMapper to connect my Postgresql database to the website. PSQL is where all the 'peeps' are kept as well as all of the users details.

## How to use as a user (intended)

If the website is hosted properly a user can go to it's homepage and see a list of all the posts. A user can then register for the site, coming up with their own username. In order to 'Peep' a user must be signed in, if not signed in they can only see all previous peeps.

## How to use as a developer

1. clone this repo
2. navigate to the directory it was cloned in
3. run ```bundle``` on the command line
4. run ```rackup``` on the command line
5. open your favourite browser and head to localhost:9292

There's also going to be some setup of database needed (i believe)
