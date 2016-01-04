Welcome to Chitter!
===================

Chitter is an interactive social platform which allows users to sign u
for a service which allows them to post thoughts, activities, tasks, feelings or
pretty much anything they want to a website where others can see it. The website
also allows users to read other users posts, showing them who posted what & at
what time the post was created!

To Run:
-------

1. Fork this repo into your local repository
2. Run 'bundle' in your terminal to acquire the necessary gems
3. Create a database using 'createdb chitter_development' in terminal
4. Create database connections using 'rake db:migrate' in terminal
5. Use the 'rackup' command to load up the website
6. Open your browser & visit 'localhost:9292'
7. Follow the interactive prompts & have fun!


Testing
----
* Initialize rspec in the main folder
* Run 'rspec' in terminal to see tests for the code

Technologies
-----------
List of technologies used:

* Ruby 2.2.3
* DataMapper
* DataMapper Postgres Adapter
* Sinatra
* Rspec
* Capybara
* Database Cleaner
* Rake
* Sinatra Flash
* BCrypt Ruby
