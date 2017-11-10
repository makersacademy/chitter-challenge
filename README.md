![](https://content.screencast.com/users/Pablo_Zendesk/folders/Jing/media/891af4f9-b04e-401b-8162-2c9bd8918cb6/00000016.png)




Chitter challenge
=================
The task : build a Twitter clone that allows users to post messages to a public stream.



Features:
-------

This app is aimed at answering the following user stories :

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





Technology used
------

Used the Sinatra framework with Ruby. Rspec and Capybara were used for  unit tests and features testing respectively.

Data mapper and postgres were used to make the data persistent in a database.

Bcrypt ruby gem was used to encrypt the password upon signing up.

Bootstrap was used for styling the interface. The app is hosted and deployed via Heroku.

How to use it
------
You can find the app [here](https://chitter-challenge-pab123.herokuapp.com/users/new) :

Feel free to sign up and chitter away !

Alternatively you can run it on your browser with the following command :  

```
rackup config.ru

```

Then go to http://localhost:9292/ 
