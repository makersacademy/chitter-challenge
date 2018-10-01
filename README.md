Chitter Challenge
=================

How to run
-------
- Clone the file and run "bundle install". 
- Type psql in terminal create two empty databases, once called "chitter" and one called "chitter_test", using this walkthrough "https://github.com/makersacademy/course/blob/master/bookmark_manager/walkthroughs/04_mac.md"
- Run tests with rspec in terminal  
- Run rackup in terminal and go to localhost:9292 to use the app. 

Features
-------

- User stories 1-4. 
- User can sign in with name, password, email and username, which are stored in a database.
- Users cannot enter a username and email which have already been taken.
- Users can see the previous posts made in reverse chronological order.
- Users can add their own posts, which will be displayed with their username, name, and date and time of creation.

What I used
-----

- Datamapper ORM. 
- Capybara for feature testing

My Goals 
------
- Apologies, but once again I don't have any specific goals which I'd like the feedback to be based around. I'm just looking for general feedback on how I could do better. 

What I think I did well
------
- Complete test coverage
- Test database and real database are seperate, with test database resetting each time 
- Completely satisfied the needy Rubocop
- It works 

What I found difficult
-----
I found installing the Datamapper ORM and getting it to work very challenging, party because of a lack of attention to instructions on my part. Once it was working, I found it very difficult to manipulate, but mainly that was because I was unclear what type of objects it was returning. Once I'd realised that was the problem and answered that for myself, it became much easier to use. That process taught me a lot, but it did eat into a lot of my time, so I didn't have time to try the harder user stories. 

If I'd had more time
-----------
I think I have too much logic in my app.rb, if I'd had time I would have extracted my flash error message into the model more.

I would have liked to have figured out how to make the time of the posts look better. I couldn't work out how do this in the html views. Requiring Time in erb prooved to be challenging. 


