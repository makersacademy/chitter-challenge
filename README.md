Chitter 
=================

A very brief personal message:
I have used ActiveRecord for this project, which led me down to a bit of a rabbit hole while setting it up to work with Sinatra. Almost all the information available for ActiveRecord is based on Rails framework and since Rails has ActiveRecord built into it, it was fairly challenging just to connect ActiveRecord to Sinatra and the database. 

On a positive note, ActiveRecord really helps simplify interaction with the database and eliminates the need for constructing own repositories (and subsequent unit tests). It handles relatively complex SQL queries in a easy to read and efficient way.

Features:
-------
- Users need to register to post. Passwords are encrypted upon saving. Users cannot register with a username or an email that already exists in database.
- Users can register and login / logout. Credentials are checked when they are logging in.
- Users are redirected to login page if they try to post / reply to other posts unless they are logged in.
- Users see the posts in reverse chronological order on the main page. Main page is accessible even if they are not logged in.
- Users can post new posts. Posts display their author's username, as well as the date it was posted on.
- Users can reply to existing posts. Replies are in chronological order unlike the main posts to make it easier to follow a discussion.
- All posts display their author username and the time they were posted. They consciously do not display the author's real name / surname.
- Users can tag other users if they use an @ sign followed by another user's username (i.e. "I'm tagging @Useface here"). The tagged user will get a notification email.
- User input is checked and validated to prevent malicious intent.

How does it work:
-------
The routes can be summarised by the diagram below.
![Excalidraw diagram showing how routes and redirections work](https://i.ibb.co/SV3dv6X/main-graphic.png)

There are two tables for the database; users and posts. They share a one to many relationship, meaning each user can have multiple posts but a post only belongs to a single user. Users are referred with a user_id foreign key in the posts table.

Table Structure:

Users have - id, username, real_name, email, password (encrypted) 
Posts have - id, content, parent_id (optionoal), created_at, updated_at, user_id (foreign key to users.id)

At this point it is important to talk about how reply feature (therefore parent_id) works. 
Suppose we have a 4 posts in total, lets call them Post_1, Post_2, Post_3 and Post_4. Lets assume Post_2 and Post_3 are responses to Post_1, making a tree structure similar to below:

```
    Post_1      Post_4
    /    \
Post_2  Post_3    
```
In this scenario, Post_1 and Post_4 are the top layer of the structure, making them parent objects. Since they do not have any parents themselves, they have null values for their parent_id column. Post_2 and Post_3 are children of Post_1 as they are replies to that particular post, their entire existence relies on Post_1. Their parent_id is the id of the original post (Post_1), giving them a parent-child association.

ActiveRecord allows us to record this parent child relationship into the model object, so when the query returns from the database, each post object's children can be accessed through the parent post object to pass into erb. This is crucial, as we want to display the children of a post right underneath their parents and not based on their row in the database. The model, app and html files look as below:

```ruby
#lib/post.rb
class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :parent, class_name: "Post"
  has_many :children, class_name: "Post", foreign_key: "parent_id"
end
```

```ruby
#app.rb
get '/' do
  @posts = Post.includes(:children, :user)
           .joins(:user)
           .order(created_at: :desc)
           .order("children_posts.created_at": :asc)
           .all
  erb :index
end
```

```html
<!-- views/index.erb -->
<% @posts.each do |post| %>
  <% if post.parent_id.nil? %>
  <p><b>Chit:</b> <%=post.content%> <br> <b>By:</b> <%=post.user.username%> <b>At:</b> <u><%=post.created_at.to_formatted_s(:chitter)%></u> <a href="reply/<%=post.id%>">Reply</a></p>
    <% post.children.each do |reply| %>
    <p style='color: navy;'><b>►►► Reply:</b> <%=reply.content%> <b>By:</b> <%=reply.user.username%> <b>At:</b> <u><%=reply.created_at.to_formatted_s(:chitter)%></u></p>
    <% end %>
  <% end %>
<% end %>
```

Overall, the app looks like this on the main page:
![screenshot from mainpage](https://i.ibb.co/2vjXSW0/main-page.png)

Installation
-----------
```bash
# Clone the project
git clone https://github.com/umutbaykan/chitter-challenge.git

# Install gems
bundle install

### Creating databases - Method 1 ###
# Create databases (database names are chitter_test and chitter_development - terminal will produce an error (Database 'chitter_test' already exists) if you have a database with the same name. 

rake db:create

# Create tables - we need to create tables both for the development and test databases. The first line creates it for the development db whereas the RACK_ENV='test' statement works on the test database.

rake db:schema:load 
rake db:schema:load RACK_ENV='test'

# Seed the test database (optionally, if you want to see the app working from the get go, you can also run the same seeds on the deployment database

rake db:seed #this bit is optional if you want to see the app already seeded on localhost
rake db:seed RACK_ENV='test'

### Creating databases - Method 2 ###
# Alternatively if you want to bulldoze over the existing databases and save on a few lines of code you can do this. Beware, this would drop your chitter_test and chitter_development db's if they exist and replace them with this app's schema. It also seeds the development database from scratch

rake db:reset

# Seed the test database

db:reset RACK_ENV='test'

# Run tests, it should be passing all of them and coverage should be %99

rspec

# Launch rackup server

rackup

# Now you should be able to access the app through http://localhost:9292/
```
Important thing to note here, the mail gem currently relies on local environment variables. If you want to send actual e-mails, you need to configure it for your own settings. For testing purposes, the module is on :logger settings so the tests only check the terminal output rather than actual emails. More information can be found through here:
https://www.rubydoc.info/github/mikel/mail/Mail.defaults

Dependencies:
-------
```
gem "sinatra" # -> main framework for our app
gem "pg" # -> so that our app can connect to PostgreSQL
gem "activerecord" # -> ActiveRecord ORM to construct tables
gem "sinatra-activerecord" # -> so that ActiveRecord runs in Sinatra
gem "rake" # -> handling out databases and seeds (not the tables!)
gem "bcrypt" # -> encrypting user passwords before storing them in our database / decrypting it during login
gem "sinatra-contrib", "~> 3.0" # -> additional features for sinatra, not sure which features rely on it just yet
gem "sinatra-flash", "~> 0.3.0" # -> helps to pass error messages back to user if they put in invalid input
gem "webrick", "~> 1.8" # -> helps with authentication through http? (again, not sure)
gem "rack-test", "~> 2.1" # -> runs our web-based application
gem "faker" # -> creates fake test data that is unique
gem "mail", "~> 2.7.1" # -> for sending emails to tagged users

For testing purposes:
gem 'rspec' # -> testing
gem 'simplecov', require: false # -> checks and visualizes code coverage in tests
gem 'simplecov-console', require: false # -> allows us to get an html page of our coverage results
gem "capybara" # -> very useful tool in tests that could simulate user interactions with pages. wish I used it earlier
gem "orderly" # -> allows to check in which order html elements are displayed (required to check order of posts)
gem 'database_cleaner-active_record' # -> resets the database before / after tests
```

#TODO's
-----------
- CSS. Pages currently link to bootstrap but does not use any of its functionality
- Additional depths in post replies. Currently you can only reply to the parent post and children cannot have replies. The structure actually allows for posts to be made on replies as well, but did not implement it to keep it simple on the main page. One thing that can be done is to direct the user to a separate page which renders all the parent-child (and potentially n layers of children if they exist) posts.
- Form validations are done crudely, need to find a gem that does validations automatically.
- Configuration is currently a mess. 