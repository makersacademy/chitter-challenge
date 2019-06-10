# Peter's Chitter challenge

**Try it out here: https://peters-peeps.herokuapp.com**

Original challenge instructions: https://github.com/makersacademy/chitter-challenge

## Setup instructions:
1. Create database: ```CREATE DATABASE chitter WITH ENCODING 'UTF8';```
2. Create test database: ```CREATE DATABASE chitter_test WITH ENCODING 'UTF8';```
3. Install dependencies: ```bundle install```
4. Run the app: ```rackup``` or ```ruby app.rb```

## My approach
 * Used the [DataMapper](https://datamapper.org/) ORM for the first time
 * Took an iterative test-driven approach, starting with just a list of peeps, adding user login, then registration & logout, then linking the users and peeps table to associate a peep with a user
 * I then decided to implement replying to peeps, by associating the peeps table with itself, rather than creating a new table. Each peep has an optional parent peep.
 * I worked on the CSS, using CSS I made for the last challenge as a starting point
 * I deployed to Heroku


 ## My thoughts & next steps
* Doing this iteratively made it a longer process than if I had just aimed for the full functionality from the start
* Using an ORM seemed like it would make things really easy, but I spent a lot of time troubleshooting the ORM and figuring out how it worked, without being able to easily see behind the scenes.
* Deploying to Heroku with a database was surprisingly easy
* I wasn't sure how to unit test properly when using the ORM. My unit tests are definitely not isolated, not even from the other objects in the model. Something to look into or discuss in the future.
* I didn't implement email notifications, but have at least thought about how I would implement them.