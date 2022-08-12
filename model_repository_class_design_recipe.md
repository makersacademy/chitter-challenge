1. Design and create the table
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
    def intialize(name, email_address, password, username)
      @name = name
      @email_address = email_address
      @password = password
      @username = username
    end

    def name
      @name
    end

    def email_address
      @email_address
    end

    def password
      @password
    end

    def username
      @username
    end
  end

  class Peep
    def intialize(content, date, user_id)
      @content = content
      @date = Date.new
      @user_id = user_id
    end

    def content
      @content
    end

    def date
      @date
    end

    def user_id
      @user_id
    end
  end

5. Define the Repository Class interface
  class UserRepository
    def all
      # Exectues the SQL query:
      # SELECT name and username from users;
      # Returns an array of user objects' names and usernames
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
      # ($1, $2, $3),
