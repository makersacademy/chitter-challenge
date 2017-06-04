# Chitter
## Makers Academy Week 4 Weekend Challenge

### What it Does
Emulates some of the functions of Twitter using Sinatra, DataMapper, Ruby and a lot of debugging, swearing and crying. The testing infrastructure uses RSpec and Capybara.

### How to Use
Clone this repository and then navigate to the app folder via the command line.
```
ruby app.rb
```
Then use a browser of your choosing to navigate to localhost:4567!

Capybara and RSpec tests can also be run from the root folder by typing 'rspec'.


Currently, a user can sign up with an email address, name, user name and password but I wouldn't recommend using any real data here. Novelty use only!


Peeps (similar to yet legally distinct from tweets) are shown in reverse chronological order with a timestamp.

### My Approach
![some initial thoughts](https://github.com/wemmm/chitter-challenge/blob/master/somethoughtsondatabases.PNG)

My approach was to draw out some ideas on database structure and then spend a long time wrangling with configurations- I found Sinatra pretty easy to set up this week (huge improvement) but getting all of the required gems working was very time consuming. Once I had the database, DataMapper and DatabaseCleaner working, I followed TDD to add features. I'm not completely happy with my progress as I didn't get to any of the extra user stories but I think the basic functionality is pretty solid.

### Additional Things
I haven't had a chance to properly integrate encryption yet and that's something I'm hoping to get sorted out during refactoring. It's also ugly as hell due to a total absence of CSS- time was quite a limiting factor here so I tried to go for functionality over looks but I would really like to work on that too.

There is currently a failing feature test for displaying user names on peeps which I'm having a lot of trouble with.
