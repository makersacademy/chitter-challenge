1. Design and create the tables
  Table: users
  Columns: id, name, email_address, password, username

  Table: peeps
  Columns: id, content, date, user_id

2. Create Test SQL seeds
  TRUNCATE TABLE users, peeps RESTART IDENTITY;

  INSERT INTO users ("name", "email_address", "password", "username") VALUES
  ('Sophie', 'sl@aol.com', 'abc123', 'SL'),
  ('Mabon', 'mg@aol.com', 'def456', 'MG');

  INSERT INTO peeps ("content", "date_time", "user_id") VALUES
  ('Hello', '2022-06-08 12:00:00', 1),
  ('It is sunny today', '2022-08-03 11:00:00', 1),
  ('What is everyone doing today?', '2022-07-17 13:00:00', 2);

  3. Define the class names
    class User
    end

    class UserRepository
    end

    class Peep
    end

    class PeepRepository
    end

  4. Implement the Model class
  class User
    attr_accessor :id, :name, :email_address, :password, :username
  end

  class Peep
    attr_accessor :id, :content, :date_time, :user_id
    def initialize
      @date_time = DateTime.now
    end
  end

5. Define the Repository Class interface
  class UserRepository
    def all
      # Executes the SQL query:
      # SELECT * FROM users;
      # Returns a list of all users created
    end

    def create(user)
      # Exectues the SQL query:
      # INSERT INTO users (name, email_address, password, username)
      # VALUES($1, $2, $3, $4)
      # Creates a new user account
    end

    def find_by_email(email_address)
    # Executes the SQL query:
    # SELECT id, name, username FROM users WHERE email_address = $1;
    # Returns account details if email address exists, otherwise returns nil
    end

    def sign_in(email_address, submitted_password)
      # checks via find_by_email if email_address exists
      # if so, then password will be checked
      # If correct password, then successful log in.
    end
  end

  class PeepRepository
    def all
      # Executes the SQL query:
      # SELECT * FROM peeps;
      # Returns a list of all peeps created
    end

    def create(peep)
      # Executes the SQL query
      # INSERT INTO peeps ("content", "date_time", "user_id") VALUES
      # ($1, $2, $3)
    end
  end

6. Write Test Examples
  # Examples

  #1
  #Get all peeps

  repository = PeepRepository.new

  peeps = repository.all

  peeps.length # => 3

  peeps[0].id # => 1
  peeps[0].content # => 'Hello'
  peeps[0].user_id # => 1

  peeps[1].id # => 2
  peeps[1].content # => "It is sunny today"
  peeps[1].user_id # => 1
 

  #2
  #Create and add peep to list

  repository = PeepRepository.new
  peep = Peep.new
  peep.content = "What's everyone's plans tonight?"
  peep.user_id = 2
  repository.create(peep)

  peeps = repository.all

  peeps.last.content # => "What's everyone's plans tonight?"
  peeps.last.user_id # => 2


  #3
  #Get a list of all user accounts

  repository = UserRepository.new

  users = repository.all

  users.length # => 2

  users[0].id # => 1
  users[0].name # => 'Sophie'
  users[0].email_address # => 'sl@aol.com'
  users[0].password # => 'abc123'
  users[0].username # => 'SL'

  users[1].id # => 2
  users[1].name # => 'Mabon'
  users[1].email_address # => 'mg@aol.com'
  users[1].password # => 'def456'
  users[1].username # => 'MG'


  #4
  #Create new user account

  repository = UserRepository.new
  user = User.new
  user.name # => "Twm"
  user.email_address # => "twm@aol.com"
  user.password # => "twm123"
  user.username # => "TwmJam"

  repository.create(user)

  users = repository.all

  users.length # => 3
  users.last.name # => "Twm"
  users.last.username # => "TwmJam"

  #5
  #Find account by email

  repository = UserRepository.new

  user = repository.find_by_email('sl@aol.com')
  user.name = 'Sophie'

  #6
  #Allow users to sign in
  repository = UserRepository.new
  account = sign_in('sl@aol.com', 'abc123')
  user = repository.find_by_email('sl@aol.com')
  encrypted_submitted_password = BCrypt::Password.create('abc123'
  expect(user.name) # => 'Sophie'

  expect(user.password == encrypted_submitted_password).to eq true





  7. Reload the SQL seeds before each test

  8. Test-drive and implement the Repository class behaviours
