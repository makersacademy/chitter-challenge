<!-- STRAIGHT UP

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


post peep chitter maker see_all peep_time sign_up

Table

users - id, name, username, email, password, logged_in
posts - post_id, post_time, message


----------

Repos

UserRepo - create, all, delete(id)
User - id, name, email, password, logged_in

PostRepo - create, all, delete(id)
posts - (id, post_time, message) from posts table (user_id, name, username) from users table

--------

Tests

user repo - all, create, delete, login, logout
post repo - all, create, delete

-------------------------------------------

Get - all posts, login form,

Post - create post, delete post, delete user

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
I want to receive an email if I am tagged in a Peep -->
