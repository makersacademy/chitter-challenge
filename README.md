***CHITTER***

This weekend I have created a full stack web application to fulfill the following user requirements;

- As a Maker
  So that I can let people know what I am doing  
  I want to post a message (peep) to chitter

- As a maker
  So that I can see what others are saying  
  I want to see all peeps in reverse chronological order

- As a Maker
  So that I can better appreciate the context of a peep
  I want to see the time at which it was made

- As a Maker
  So that I can post messages on Chitter as me
  I want to sign up for Chitter

I have used Datamapper to establish the connection to my database, and I have also used seeders to pre-populate my database with users and peeps. 

The web app has an index page that asks for user details to allow a user to sign up. After filling in the form and submitting their details, the user is redirected to the home page where all peeps are displayed. 

On the home page, there is also a form for writing your own peep and posting it to the stream. 

All peeps are displayed in reverse chronological order, and are timestamped for clarity. At first, I did display the username for all peeps too, but as I haven't used a test database for my tests, the strem quickly became crowded with peeps from my test user. 

Throughout this challenge, I have been referring to the walkthrought form previous challenges we have done, as well as using Google. 

For learning DataMapper, I watched [this] (https://code.tutsplus.com/tutorials/ruby-for-newbies-working-with-datamapper--net-19622) video.
