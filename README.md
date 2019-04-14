# Chitter

This is a messaging web app that you can use to post messages (peeps) which are added to the Chitter feed.

## Planning

Before starting on the challenge I put together an entity relationship diagram to help plan the structure of the Chitter database.
<p align = "center">
<img src ="https://github.com/Ajay233/chitter-challenge/blob/master/diagrams/entity_relationship_diagram.png?raw=true">
<!-- ![Entity Relationship Diagram](https://github.com/Ajay233/chitter-challenge/blob/master/diagrams/entity_relationship_diagram.png?raw=true) -->
</p>
I drafted a rough mock up of the pages I thought would be needed to meet the requirements of the user stories.

![Mock up of Chitter pages](https://github.com/Ajay233/chitter-challenge/blob/master/diagrams/mockup_of_chitter_pages.png?raw=true)

I also drafted a domain model diagram so that I could map out the processes that would be required to provide the functionality outlined in the user stories.

![Domain model diagram](https://github.com/Ajay233/chitter-challenge/blob/master/diagrams/Domain%20Model%20Diagram.png?raw=true)


### Technology used

To create the app I have used:
- Ruby
- Sinatra
- Sinatra Flash
- JQuery
- HTML
- CSS
- PostgreSQL
- Bootstrap
- Fontawesome
- BCrypt


For testing I used:
- Rspec
- Capybara


# Instructions for running app

### 1. Fork this repository

First you will need to fork this repository so that you can clone the forked repo to your own machine.  

### 2. Set up the database

1. First connect to psql by typing `psql` in the command line.  If you don't have PostgreSQL installed already you can install it using the  instructions at: https://github.com/makersacademy/course/blob/master/bookmark_manager/walkthroughs/04_mac.md

2. Next you will need to create the database copying and pasting the psql command:
`CREATE DATABASE chitter;`

3. In order to connect to the database you will need to use the `pqsl` command `\c chitter;`

4. Once you have connected to the chitter database the command line will show .  At this stage you can copy and paste the query which is saved in the file `01_create_users_table.sql`.  This will create the users table for storing user profiles.

5. The next query you will need to run is saved in the file `02_create_peeps_table.sql` which will generate the peeps table for storing posted messages.

N.B - Migration scripts are saved in the migrations folder which is in the db folder within the root of the project as outlined below:
```
db
  migrations
    01_create_users_table.sql
    02_create_peeps_table.sql
```

### 3. Running the app

If you don't have rack installed you can install it by running ```gem install rack``` in the command line.  

Once you have completed the steps above you will be able to run the app.  In the command line, you need to be in the root of the chitter-challenge folder.  You then just need to type: ```rackup```

You should see a message similar to the one below confirming the app fired up and is running on port 9292:
```
[2019-02-11 14:56:17] INFO  WEBrick 1.4.2
[2019-02-11 14:56:17] INFO  ruby 2.5.1 (2018-03-29) [x86_64-darwin15]
[2019-02-11 14:56:17] INFO  WEBrick::HTTPServer#start: pid=66059 port=9292
```

Now you can open your browser and type in ```localhost:9292``` which will load the welcome page and where can start using the app.

To stop the app from running hit ```Ctrl + C``` in the command line and you should get a message similar to the one below confirming that the app is shutting down:
```
[2019-02-11 17:17:59] INFO  going to shutdown ...
[2019-02-11 17:17:59] INFO  WEBrick::HTTPServer#start done.
```

*** For full details about the rack gem are available on the rack Github page: https://github.com/rack/rack ***


# How the app works

### The welcome page

Once you have the app running and you go to ```localhost:9292``` in your browser, the app will load the welcome page.

![Welcom Page](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen1.png?raw=true)

Here you can sign up if you don't have an account by clicking on the sign up button.  Alternatively you can click click on the menu icon which will give you the drop down menu shown below.  Users that are not signed in have guest access so they can view the peeps (posts) that have been made by clicking on Message Feed or they can login.

![Initial menu](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen2.png?raw=true)

### Peeps page (where all the posts live)

Users that have not logged in can only view messages but are unable to post messages to the feed.  

<!-- ![Peeps page](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen3.png?raw=true) -->

![Post a message](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen4.png?raw=true)

### Attempting to posting a message while not logged in

If a guest user tries to access the "Post a message" feature, they will be redirected back to the welcome page where a flash message notifies the user that they have to be signed in to post messages.  The idea behind taking the user back to the welcome page was to provide the user the option to sign up if they do not have an account.

![You have to sign in to post](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen5.png?raw=true)

### Sign up

When a user clicks on the sign up button they are taken to the sign up page where they can enter a the username and password they want to use for their account, as well as some personal details that allow are used to provide extra features.

![Sign up page](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen6.png?raw=true)

When the user submits the sign up request, checks is made against records already held in the database.  

If the user has entered a username that is already in the database the use will be presented with a flash message containing a notification that the username is already taken.

![Username taken](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen7.png?raw=true)

If the user has entered an e-mail address that is already in the database the user will be presented with a flash message notifying them that the e-mail address is already associated with an account.  This was implemented to prevent users signing up for multiple accounts using a single e-mail address.

![Email in use](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen8.png?raw=true)

If the checks do not match any records in the database, the user's request will be successful, their details will be added to the database creating their account.  The user will be presented with a flash message notifying that their request was successful and welcoming them to Chitter.  The user is also shown as signed in within the navbar, denoted by the user icon next to their name.

![Successful sign up](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen9.png?raw=true)

### login

If a user clicks on login within the drop down menu, they are taken to the login page where they are prompted to enter their username and password.  A link was also included below the sign up submit button so a user can choose to sign up instead in case they have mistakenly thought they had an account or came to the page by mistake.

![Login page](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen10.png?raw=true)

When the user has entered their details and clicked submit, a search is carried out records matching the username.  A second check is then carried out to compare the password submitted against the password held for that record.  If either details do not match, the user is presented with a flash message notifying them that either their username or password was incorrect.  

![Details incorrect](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen11.png?raw=true)

If the details do match, the user is automatically taken to the message feed and presented with a flash message welcoming them back to Chitter.

![Successful login](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen12.png?raw=true)

### After sign up or login

After a successful sign up or log in, as mentioned above, a user is shown as logged in within the navbar; however the drop down menu is also updated showing the option to log out instead of login. This was achieved using JQuery to hide options that don't apply.

![Updated Nav bar and Menu](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen13.png?raw=true)

### Posting a peep

Once a user is signed in, they can post messages to the message feed by clicking on "Post a message".  They are then taken to a page where they can draft their message and post it.

![Posting a Peep](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen14.png?raw=true)

When the user clicks submit, they are redirected back to the message feed where their message is displayed at the bottom of the list.  The feed can however be sorted to show the newest first as below.  To do this the user just has to click on the dotted icon which will trigger the drop down menu.  Here the user can select how they want to sort the list by clicking on either newest first or oldest first.  This menu has also been implemented using JQuery so it is only displayed on the message feed page.  Both the sort and main menus also use JQuery for the drop down functionality so the menus remain hidden until the relevant icon is clicked.

![Peep added](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen15.png?raw=true)

### Log out

Finally, when a user wants to log out, they just need to click on logout within the main drop down menu.  They will then be signed, taken back to the welcome page where they are presented with a flash message notifying them that they successfully signed out.

![Logged out message](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen16.png?raw=true)
