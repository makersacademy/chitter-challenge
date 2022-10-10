# EXAMPLE
# Table name: users

# Repository class
# (in lib/user_repository.rb)

class UserRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, username, email,password FROM users;

    # Returns an array of user objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id,WHERE id = $1;

    # Returns a single Student object.
  end

  # Add more methods below for each operation you'd like to implement.

  # def create(user)
    executes the SQL query:
    INSERT INTO users (name, username, email, password) VALUES($1, $2, $3, $4)

    returns ''
  # end

  # def update(student)
  # end

  # def delete(student)
  # end
end

# EXAMPLES

# 1
# Get all users

<!-- repo = UserRepository.new

user = repo.all

expect(user.length).to eq("5") # =>  5

expect(user[0].id).to eq("1") # =>  1
expect(user[0].name).to eq("Hibaq") # =>  'Hibaq'
expect(user[0].username).to eq("Hibaq123") # =>  'Hibaq123'
expect(user[0].email).to eq("hibaq@gmail.com")
expect(user[0].password).to eq("potatolife")

expect(user[1].id).to eq("2") # =>  1
expect(user[1].name).to eq("Anna") # =>  'Hibaq'
expect(user[1].username).to eq("Anna123") # =>  'Hibaq123'
expect(user[1].email).to eq("Anna@gmail.com")
expect(user[1].password).to eq("Userlife123")

expect(user[1].id).to eq("3") # =>  2
expect(user[1].name).to eq("James") # =>  'Anna'
expect(user[1].username).to eq("James123")
expect(user[1].email).to eq("Zara@gmail.com")
expect(user[1].password).to eq("Welcometo") -->
 # =>  'May 2022'

# 2
# Get a single user

repo = UserRepository.new

user = repo.find(1)

expect(user.id).to eq("2") # =>  2
expect(user.name).to eq("Anna")
expect(user.username).to eq("Anna@gmail.com")
expect(user.email).to eq(" Userlife123") # =>  'April 2022'

# 3
# Create a single user
    repo = UserRepository.new

    new_user = user.new
    new_user.name = 'Theresa'
    new_user.username = "Theresa123"
    new_user.email = "Theresa@gmail.com"
    new_user.password = "hello123"
    repo.create(new_user)

    users = repo.all

    expect(users.length).to eq(6)
    expect(users.last.username).to eq("Theresa123")
    expect(users.last.email).to eq("Theresa@gmail.com")
    expect(users.last.password).to eq("hello123")


    # EXAMPLE


# Table name: peeps

# Repository class
# (in lib/opeep_repository.rb)

class PeepRepository

  # Selecting all peeps
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, message, time_stamp FROM users;

    # Returns an array of user objects.
  end


  # Add more methods below for each operation you'd like to implement.

  # def create(peep)
    executes the SQL query:
    INSERT INTO peeps (message, username, email, password) VALUES($1, $2, $3, $4);

    return ''
  # end

  # def update(student)
  # end

  # def delete(student)
  # end
end

# EXAMPLES

# 1
# Get all peeps

query = "SELECT id, message, time_stamp, user_id FROM user_peeps;"
        params = []
        result_set = DatabaseConnection.exec_params(query, params)
        peeps = []
      
        result_set.each {|peep| 
            peep = Peep.new
            
            peep.id = peep["id"]
            peep.email_address = peep["message"]
            peep.username = peep["time_stamp"]
            peep.user_id  = record["user_id"]
            
            peeps << peep
        }
        return peeps

  ## tests for all peeps:

    it "returns all peeps" do
        repo = PeepRepository.new

        peeps = repo.all
    
        expect(peeps.length).to eq 6
        expect(peeps.first.message).to eq("message1")
        expect(peeps.first.time_stamp).to eq("23:12:00")
        expect(peeps.first.user_id).to eq("1")
    end

  # 2 it creates a new peep

    sql = 'INSERT INTO peeps (message, time_stamp, user_id) VALUES ($1, $2, $3, $4);
    params = [user.name, user.username, user.email, user.password]
    DatabaseConnection.exec_params(sql, params)
    
    return ''