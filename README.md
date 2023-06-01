Chitter Challenge
=================
# chitter-challenge

A twitter clone, my first complete web application as part of Makers Academy.

This project has been designed to improve our understanding of HTTP requests and responses, designing routes and structuring web applications. It contains:

 - Users who are able to make posts.
 - A homepage displaying all posts and their creator and time
 - A sign up form to create a new user and start making posts.
 - A user specific page in which you can view only their posts.
 - Tagging functionality within posts so users can tag other users (with `@username`) which will contain a link to that user's page
 - A login page in which a user can login and only post as them
 
This was a challenging and enjoyable project.
The most difficult part was implementing a login feature which I first did manually. I attempted this by creating a GET '/:id' route which goes to a specific user's homepage. Once logged in, the main homepage is redirected to a specific page where only they are able to make posts. I did this by redirecting the GET '/' route to the user specific homepage. However this is not secure, since anybody could manually call upon the '/1', for example, and be logged in as user with ID=1. This was an interesting learning experience in understanding and developing new routes which are connected to each other! But not best practise.

So I researched the sessions functionality in Sinatra which allows us to create a session associated with the user's ID number after they login. Then, in the homepage route, we simplt have to check the session[:user_id] value and return a different HTML page if that value is not nil (ie, a user is logged in).

Going further, I will look into the Bcrypt password encryption

## Process
I first designed the table schema for users and peeps.
Then created and test drove the model and repository classes for both Users and Peeps. These repository classes allow our application to interact with the database through the PG gem and PostgreSQL.
Then I began designing the routes for our sinatra application and test drove those one by one.

## How to use

```shell
# Make the DB:
createdb chitter_site

# Install gems:
bundle install

# Run the tests:
rspec

# Run server
rackup
```

## Built with
- Ruby
- Rspec
- Sinatra
- PostgreSQL

## Still to add
- Bcrypt functionality
