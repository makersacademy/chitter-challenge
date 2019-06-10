Ed's Chitter Challenge
=================
                                                                                                                        
                                                                       .                                                
                                 . .                           .  ...............  .....                                
                                 ...                         .....777I7I777I..... ......                                
                                ...+. .                      ...I7777777777I77I....,7II.                                
                                 .77I...                   . .I7I777777777777777I7777?.....                             
                                ..I77I7....                ..I7I77777777777777I777I7....7..                             
                                 .7777II.....              .7777777777777777777777:?I7II...                             
                                .,77I7I7I7=...   .         .7777777777777777777777III7.....                             
                                 .I7777777II7.... .       .77777777777777777777777II=...                                
                                 .77777777I7I7I7I....     .77I77777777777777777777I.....                                
                                 ..77I777777777777777......I7I77777777777777777777I.                                    
                                ....777777777777777II7III7777I777777777777777777777                                     
                                .+...II77777777777777777777777777777777777777777777                                     
                                .,7I777I7777777777777777777777777777777777777777I77 .                                   
                                 .I77777777777777777777777777777777777777777777777.                                     
                                ..?I7777777777777777777777777777777777777777777777.                                     
                                 ..77I777777777777777777777777777777777777777777I?. .                                   
                                 ...:77777777777777777777777777777777777777777777..                                     
                                    ..777I777777777777777777777777777777777777II=.                                      
                                    .....I77777777777777777777777777777777777III..                                      
                                    ..7777777777777777777777777777777777777II7I...                                      
                                    ...III777777777777777777777777777777777777...                                       
                                     ...7I777777777777777777777777777777777I7.. .                                       
                                      ...I777777777777777777777777777777777I...                                         
                                       .....7III7777777777777777777777777I7....                                         
                                          ......777777777777777777777777I.....                                          
                                     .........77II777777777777777I77II77...                                             
                              ..   .......+I777I777777777777777777III7.. ..                                             
                              .=I++I7I777I777777777777777777777777I~.   ..                                              
                              ....I7777777777777777777777777777II...                                                    
                                .....~777777777I7I77I7I7I777I~....                                                      
                                     .... .:77777I7I777:......                                                          
                                            . ..  . .   .. ..                                                           
                                                                                                                        
                                                                                                                        

Technologies Used
-----------------
* Bcrypt
* Datamapper
* Postgres
* Sinatra-Flash

User Stories
------------------
```As a user
So that I can let people know what I am doing, regardless of whether or not it's interesting 
I want to post a message (peep) to chitter
```

```As a user
So that I can get a distorted view of my acquaintances' activities in close to real time 
I want to see all peeps in reverse chronological order
```

```As a user
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

```As a user
So that I can post messages on Chitter as me
I want to sign up for Chitter
```

Database Setup
------------------
1. Connect to psql
2. Create two databases, a live and test database, using the following psql commands;
  * ```CREATE DATABASE chitter;```
  * ```CREATE DATABASE chitter_test;```
3. Connect to each database in turn using the pqsl commands;
  * ``` \c bookmark_manager;``` and ```\c bookmark_manager_test;```
4. Run the following queries in each database;
  * 01_create_messages_table.sql
  * 02_create_user_table.sql
  * 03_populate_anon_user.sql
  * 04_edit_messages_table_FK.sql
  * 05_populate_messages.sql

Stuff to Do
-------------
LOADS. 
* Couldn't get BCrypt working properly to check submitted passwords were correct
it means you can't log in and can only post anonymously. Have cheated this for new registrations as they're taken straight to homepage, already logged in

* haven't done any refactoring - it's a mess

* css and UI is shite

* can't post cheeps with certain characters, e.g. apostrophes, due to the following, where 'message' is the content of the written cheep;
```def self.add(message, user_id = 1, time = Time.new)
   set_database
    @con.exec("INSERT INTO messages (content, postedat, userid) VALUES ('#{message}', '#{time}', #{user_id});")
  end
  ```

* haven't done validation for checking passwords are the same, or that a user is entering a unique e-mail address, so you can error it by creating two accouns with the same address

* in general this took absolutely ages to get anything even half way working and was huuuugely frustrating :-(


