# Chitter Challenge
Chitter challenge is a twitter clone which allows users to view posts (called
'peeps') in reverse alphabetical order, as well as being able to add a new post
via the text input field at the top. The application functions on a single page,
with the peeps wall automatically updating when a new peep is added.

![Screenshot of Chitter](https://github.com/djlonboy/chitter-challenge/blob/master/docs/chitter_screenshot.png)

### Stories Completed
```
As a Maker
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a Maker
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a Maker
So that I can better appreciate the context of a peep
I want to see the time at which it was made
```

### Build Status
The application currently works for all of the above user stories.

Additionally, the Peep class also has support for checking whether a username is
valid before posting a peep, and the database also contains a table for users,
although currently usernames are not yet implemented on the front-end.

### How it Works
The front-end website consists of a single page hosted on the '/' index address.
The controller pulls a list of peeps and the index view file posts them to the
page by running an ```each``` loop to cycle through each peep.

The application model consists of classes for Peep and Wall. An additional class
for User has also been added but is not yet functional.

The wall consists of a list of previously added peeps, displayed in reverse
alphabetical order. The display is handled by the Wall class within the model:
```ruby
class Wall

  def initialize
    @posts = []
  end

  def self.return_all
    peeps_table = DatabaseConnection.query("SELECT * FROM peeps;")

    posts = peeps_table.map do |row|
      Peep.new(row['id'], row['datetime'], row['username'], row['post'])
    end

    sort(posts)
  end

  def self.sort(posts)
    posts.sort_by { |peep| peep.content[:datetime] }.reverse
  end

end
```
The .return_all class method queries the peeps table in the database, and pulls the full
list of peeps. Each peep is wrapped in a Peep class instance, and then the .sort method
is then invoked which sorts the posts in reverse alphabetical order using their
timestamps. Wrapping the peeps in a Peep class allows the content to be called
via an attribute reader, and also includes methods for displaying the date and time
in more human-readable formats using the .return_date and .return_time methods (see below).

Posting peeps is handled by the Peep class:
```ruby
PEEP_LENGTH = 140

class Peep
  attr_reader :content

  def initialize(id, datetime, username, post)
    @content = { id: id, datetime: datetime, username: username, post: post }
  end

  def self.create(username, post)
    raise "Username not recognised" if user?(username) == false
    raise "Too many characters" if post.size > PEEP_LENGTH

    # Insert post into database
    DatabaseConnection.query(
      "INSERT INTO peeps (datetime, username, post)VALUES ('#{datetimenow}', '#{username}', '#{post}');"
    )
    "Post created"
  end

  def self.user?(username)
    # Returns false if username is not in table
    result = DatabaseConnection.query(
      "SELECT 1 FROM users WHERE username = '#{username}';"
    )
    result.map { |line| line } != []
  end

  def self.datetimenow
    DateTime.now.strftime("%Y-%m-%d %H:%M:%S")
  end

  def return_date
    Date.parse(content[:datetime]).strftime("%A %d %B %Y")
  end

  def return_time
    DateTime.parse(content[:datetime]).strftime("%H:%M")
  end

end
```
When a peep is added, the .create class method within the Peep class takes the username
and post, checks it is not longer than the limit set using the PEEP_LENGTH constant,
adds a timestamp (using the .datetimenow method), and inserts the peep into the
'peeps' table in the postgreSQL database. The wall is then reloaded to include the
most recently added peep.

An additional DatabaseConnection class handles communication with the database,
with the .setup method ensuring connection to the correct database and the .query
method taking SQL queries as arguments and pssing them to postgreSQL via the
connection.exec method:
```ruby
class DatabaseConnection

  # Takes the database to be connected to as an argument and sets
  # up the connection using PG:
  def self.setup(db_name)
    @connection = PG.connect :dbname => db_name
  end

  # Takes an SQL query as an argument and runs it using the
  # connection setup above:
  def self.query(sql)
    @connection.exec(sql)
  end

end
```

### Installation
To install and run chitter on a local machine:
 - Download the project file
 - Run ```$ bundle``` to install required gems
 - Run ```$ rake setup``` to install the database and tables
 - Run ```$ rackup``` to open a new server connection
 - Navigate to localhost:9292 on a browser to view the application

### Tests
Testing is covered by RSPEC, Capybara (for front-end) and Rubocop. Currently all
RSPEC feature and unit tests are passing:
```
Peeps page:
  - index shows all peeps
  - 'Enter a peep' adds a new peep

Peep
  - return date returns the full date of the post
  - return_time returns the time of the post without seconds
  Check_user
    - checks the user is in the database
  User creates a peep
    - method responds to correct # of arguments
    - checks the user is in the database
    - can store the peep in the database
    - rejects a peep which is too long

Wall
  - creates an array of posts in reverse chronological order

Finished in 0.28545 seconds (files took 0.54104 seconds to load)
10 examples, 0 failures
```
Tests use a different database (chittertest) which is setup on first install using
```$ rake setup``` and then populated before each test using code in the web-helpers
file in the spec folder. The database to connect to is selected using this code in the model
files:
```ruby
if ENV['RACK_ENV'] == 'test'
  DatabaseConnection.setup('chittertest')
else
  DatabaseConnection.setup('chitter')
end
```
The RSPEC spec_helper file sets the environment variable RACK_ENV to 'test', which triggers the
chittertest database to be used.

Rubocop is currently returning some issues, these are mainly to do with long lines 
required for the SQL commands. I have not been able to find a way to split these lines up.

To run tests, from within the project folder, first ensure that you have run
```$ bundle```, then run ```$ rspec``` from within the project folder. To run
rubocop, run ```$ rubocop```.
