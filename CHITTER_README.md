# Chitter

This is a messaging web app that you can use to post messages (peeps) which are added to the Chitter feed.

## Planning

Before starting on the challenge I put together an entity relationship diagram to help plan the structure of the Chitter database.

![Entity Relationship Diagram](https://github.com/Ajay233/chitter-challenge/blob/master/diagrams/entity_relationship_diagram.png?raw=true)

I drafted a rough mock up of the pages I thought would be needed to meet the requirements of the user stories.

![Mock up of Chitter pages](https://github.com/Ajay233/chitter-challenge/blob/master/diagrams/mockup_of_chitter_pages.png?raw=true)

I also drafted an entity relationship diagram so that I could map out the processes that would be required to provide the functionality outlined in the user stories.

![Domain model diagram](https://github.com/Ajay233/chitter-challenge/blob/master/diagrams/Domain%20Model%20Diagram.png?raw=true)


### Technology used

To create the app I have used:
- Ruby
- Sinatra
- JQuery
- HTML
- css
- Bootstrap
- Fontawesome
- BCrypt

Fort testing I used:
- Rspec
- Capybara


### To set up the database
1. First connect to psql by typing `psql` in the command line

2. Next you will need to create the database using the psql command
`CREATE DATABASE chitter;`

3. In order to connect to the database you will need to use the `pqsl` command `\c chitter;`

4. Once you have connected you can run the query which is saved in the file `01_create_users_table.sql`

5. The next query you will need to run is saved in the file `02_create_peeps_table.sql`
