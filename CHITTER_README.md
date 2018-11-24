# Chitter

This is a messaging web app that you can use to post messages (peeps) which are added to the Chitter feed.



### To set up the database
1. First connect to psql by typing `psql` in the command line

2. Next you will need to create the database using the psql command
`CREATE DATABASE chitter;`

3. In order to connect to the database you will need to use the `pqsl` command `\c chitter;`

4. Once you have connected you can run the query which is saved in the file `01_create_users_table.sql`

5. The next query you will need to run is saved in the file `02_create_peeps_table.sql`
