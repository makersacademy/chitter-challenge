# Features Design/Thought Process

I just wanted to keep it simple for this project and focus on developing the core functionality from an extremely basic view  
point. So everything from the database set-up to the interaction between the MVC have been developed from using very simple  
configurations and syntax.

## Database Set-up

Created two tables:

1. users

CREATE TABLE users(
user_id serial PRIMARY KEY,
user_name varchar(100) NOT NULL,
password varchar(100) NOT NULL
);

2. chitter_messages

CREATE TABLE chitter_messages(
  chitter_id serial PRIMARY KEY,
  user_id integer NOT NULL REFERENCES users(user_id),
  chitter VARCHAR(140) NOT NULL,
  posted_at TIMESTAMP DEFAULT NOW()
);

## Models

Created two models:

1. ChitterDatabase

Contains methods that interact with the database directly through postgresql queries such as checking user name and password details  
for logging-in authorisation purposes, adding chitters.

I have deliberately NOT added update or delete features for this current version with the reason being I wanted to add them later should  
I ever come back to this project with a better understanding of how to properly protect my database from such sensitive functions.

2. ChitterMessages

Contains methods that allows the controller to interact with the database. Commands go through this model in order to maintain the single  
responsibility principle, keeping code clean, easy error identification, ease of future changes and to control how database interactions  
occur within the controller.

## Views

Seperate views for user-specific chitter views and all user chitters.

Did not implement CSS styles with the exception of a basic table to make viewing chitter posts easy for development purposes. As mentioned  
above, I wanted to completely focus on functionality and core programming, database set-up this week rather than styling.

## Database Connections

One-time or scenario specific method calls within the ChitterDatabase class closes its database connections as soon as the method has  finished executing. More complex methods that need to return table content will have database connections be closed upon log-out. Log-out is  
automatically executed when a user goes back to the homepage or clicks the log-out button. The user will find that when they go to the all  
user chitters page and then decides to go back to their personal chitters page that the page recognises the fact that they are still logged  
in and will be able to see their personal chitter posts.
