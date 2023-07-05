# Chitter
![screenshot from mainpage](https://i.ibb.co/6yRwbLC/Screenshot-2023-07-03-at-23-18-55.png)

## Table of Contents

1. [Project Description](#project-description)
2. [Features](#features)
3. [Technologies](#technologies)
4. [How Does It Work](#how-does-it-work)
5. [Installation](#installation)
6. [TODO's](#todos)


## Project Description 

Chitter is a solo project completed during the Makers Academy software development course. It is a server-side rendered Twitter clone application that allows users to send posts and interact with other users through RESTful API methods. The application utilizes Ruby and incorporates the use of a PostgreSQL database to store user and post information.

## Features
This project satisfies all the requirements outlined in the Makers [brief](https://github.com/makersacademy/chitter-challenge#features) and includes additional features to enhance the functionality. The complete list of features is as follows:

- User Registration: Users are required to register to post. The application encrypts passwords for secure storage. Duplicate usernames or emails are not allowed during registration.
- User Authentication: Users can register, log in, and log out. The application verifies credentials during the login process.
- Access Control: Users are redirected to the login page if they attempt to post or reply without being logged in. However, the main page is accessible even without logging in.
- Chronological Post Order: Posts on the main page are displayed in reverse chronological order.
- Post Creation: Users can create new posts, which display the username of the author and the date of posting.
- Post Replies: Users can reply to existing posts. Unlike the main posts, replies are displayed in chronological order to make it easier to follow a discussion.
- Post Information: Posts display the author's username and the time of posting, but do not reveal the author's real name or surname.
- User Tagging: Users can tag other users by mentioning their username preceded by the "@" symbol (e.g., "I'm tagging @Useface here"). The tagged user will receive a notification email.
- Input Validation: User input is checked and validated to prevent any potential malicious intent.
  
## Technologies

- Ruby <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/ruby/ruby-original.svg" alt="ruby" width="40" height="40"/>

- RSpec <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/rspec/rspec-original.svg" alt="rspec" width="40" height="40"/>

- PostgreSQL <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/postgresql/postgresql-original.svg" alt="postgresql" width="40" height="40"/>

- HTML <img src="https://github.com/devicons/devicon/blob/master/icons/html5/html5-original.svg" alt="html" width="40" height="40"/>

Additional technologies used in the project include:

- Sinatra: Web framework.
- Capybara: Used for testing HTML content.
- ActiveRecord: Utilized for object-relational mapping.
- BCrypt: Used for password hashing.

## How Does It Work

The functionality of the application can be summarized using the following diagram:

![Excalidraw diagram showing how routes and redirections work](https://i.ibb.co/Sd1ztG5/chitterdiagram-min.jpg)

The database consists of two tables: users and posts. They are connected by a one-to-many relationship, where each user can have multiple posts, but each post belongs to a single user. Users are referred to with a foreign key in the posts table.

### Table Structure:

Users table - id, username, real_name, email, password (encrypted) 
Posts table - id, content, parent_id (optional), created_at, updated_at, user_id (foreign key to users.id)

At this point, it is important to talk about how the reply feature (therefore parent_id) works. 
Let's assume we have four posts named Post_1, Post_2, Post_3, and Post_4. Suppose Post_2 and Post_3 are responses to Post_1, resulting in a tree-like structure as shown below:

```
    Post_1      Post_4
    /    \
Post_2  Post_3    
```
In this scenario, Post_1 and Post_4 are at the top layer of the structure, making them parent objects. Since they do not have any parents themselves, their parent_id values are set to null. Post_2 and Post_3 are children of Post_1 since they are replies to that specific post. Their parent_id is set to the id of the original post (Post_1), establishing the parent-child relationship.

ActiveRecord allows us to represent this parent-child relationship in the model object. When the query is retrieved from the database, each post object's children can be accessed through the parent post object, making it easier to pass them through `erb`. This is crucial for displaying the children of a post directly beneath their respective parents, irrespective of the order in the database as replies can be posted much later than the original post they are referring to.

Here is an overview of the model, app, and HTML files:

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

## Installation

**1) Clone the project repository**
```terminal
git clone https://github.com/umutbaykan/chitter-challenge.git
```
**2) Once you are in the folder, install the required gems**
```
bundle install
```

**3) Setup the database (method 1)**

Create the development and test databases:
```
rake db:create
```
Create the tables for both databases:
```
rake db:schema:load 
rake db:schema:load RACK_ENV='test'
```
Seed the test database. Optionally, you can seed the development database as well if you want to see the application with pre-filled data:
```
rake db:seed RACK_ENV='test'
rake db:seed #optional
```

**3) Setup the database (method 2)**

Alternatively, if you want to reset the existing databases and use the application's schema:

```
rake db:reset
```
Warning: This method will drop the existing chitter_test and chitter_development databases if they exist!

Seed the test database:
```
db:reset RACK_ENV='test'
```

**4) Running Tests**

To ensure everything is set up correctly, run the tests. All tests should pass with a test coverage of 99%.
```
rspec
```

**5) Launching the Rackup Server**
   
To start the application, run the following command:

```
rackup
```
You can access the application at http://localhost:9292/.

Important Note: The mail gem currently relies on local environment variables. If you want to send actual emails, you need to configure it with your own settings. For testing purposes, the module is set to :logger so that tests only check the terminal output rather than sending actual emails. More information can be found in the Mail gem [documentation.](https://www.rubydoc.info/github/mikel/mail/Mail.defaults)

## TODO's
- CSS: Currently, the pages link to Bootstrap, but they do not utilize any of its functionality
- Additional depths in post replies: Currently, users can reply to the parent post but child posts cannot have their own replies. The application's structure actually allows for posts to be made on replies as well. Functionality can be implemented to allow replies on child posts. One idea is to create a separate page that displays all parent-child posts, including multiple layers of children if they exist.
- Form validations: The current form validations are basic and need improvement. It would be useful to find a gem that would cover a wider range of checks.
- Configuration: The current configuration setup needs some attention. Need to take the time to organize and streamline the configuration files to improve readability.
