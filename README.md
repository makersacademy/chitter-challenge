# Chitter

This is a messaging web app that you can use to post messages (peeps) which are added to the Chitter feed.

## Planning

Before starting on the challenge I put together an entity relationship diagram to help plan the structure of the Chitter database.
<p align = "center">
![Entity Relationship Diagram](https://github.com/Ajay233/chitter-challenge/blob/master/diagrams/entity_relationship_diagram.png?raw=true)
</p>
I drafted a rough mock up of the pages I thought would be needed to meet the requirements of the user stories.

![Mock up of Chitter pages](https://github.com/Ajay233/chitter-challenge/blob/master/diagrams/mockup_of_chitter_pages.png?raw=true)

I also drafted an entity relationship diagram so that I could map out the processes that would be required to provide the functionality outlined in the user stories.

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

![Welcom Page](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen1.png?raw=true)

![Initial menu](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen2.png?raw=true)

### Peeps page (where all the posts live)

![Peeps page](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen3.png?raw=true)

![Post a message](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen4.png?raw=true)

### Attempting to posting a message while not logged in

![You have to sign in to post](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen5.png?raw=true)

### Sign up

![Sign up page]()

![Username taken](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen7.png?raw=true)

![Email in use](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen8.png?raw=true)

![Successful sign up](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen9.png?raw=true)

### login

![Login page](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen10.png?raw=true)

![Details incorrect](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen11.png?raw=true)

![Successful login](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen12.png?raw=true)

### After sign up or login

![Updated Nav bar and Menu](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen13.png?raw=true)

### Posting a peep

![Posting a Peep](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen14.png?raw=true)

![Peep added](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen15.png?raw=true)

### Log out

![Logged out message](https://github.com/Ajay233/chitter-challenge/blob/master/image_files/Screen16.png?raw=true)
