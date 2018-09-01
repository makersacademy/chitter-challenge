# Chitter Challenge



## Domain Model

The model of the web app is based on MVC architecure. Currently the model is based on three classes `Peep`, `ConnectionManager` and `User`. The domain model for app is demonstrated below. 

`Peep` is the only class controlled directly from the controller. The `Peep` class delegates all actions/methods to the other classes.

The `User` class is responsible for managing user data (name, email, pw, handle).

`DatabaseManager` is used to facilitate communications with the database. The manager enables connection to either the 'development' or 'test' database and facilitates SQL queries/returns.


```
   Client
╔════════════╗  
║            ║ Sends HTTP requests
║  Browser   ║ (GET, POST, PATH, DELETE)      
║            ║
╚════════════╝
      |
      |
      |
Server (Sinatra Framework) is listening on a specific port
╔════════════╗
║            ║ Rack maps HTTP requests/response into/from Ruby
║    RACK    ║ Rac gives you a DSL to write the web app
║            ║
╚════════════╝
      |
      |
      |
   app.rb                       Model                 
╔════════════╗             ╔════════════╗       
║            ║------------>║            ║       
║ Controller ║             ║    Peep    ║  
║            ║<------------║   (class)  ║       
╚════════════╝             ╚════════════╝ 
      |                           |
╔════════════╗                    |              ╔════════════╗
║            ║                    |              ║            ║            
║   Views    ║                    |------------->║    User    ║
║            ║                    |              ║  (class)   ║
╚════════════╝                    |              ╚════════════╝
 Embedded Ruby                    | 
                                  |              ╔════════════╗    SQL query    ╔════════════╗
                                  |              ║ Connection ║---------------->║    SQL     ║
                                  |------------->║   Manager  ║ {result object} ║  Database  ║
                                                 ║  (class)   ║<----------------║            ║
                                                 ╚════════════╝                 ╚════════════╝
                                                 PG gem required
```


## User Stories

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

As a Maker
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a Maker
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter
```
