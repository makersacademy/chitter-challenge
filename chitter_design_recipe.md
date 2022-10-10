1. Design and create the Table

Record	       Properties
peeps	       content, time, user_id
users	       username, email_address, password

2. Create Test SQL seeds

TRUNCATE TABLE users, peeps RESTART IDENTITY;

INSERT INTO users (username, email_address, password) VALUES ('ollie', 'ollie@gmail.com', 'owl');
INSERT INTO users (username, email_address, password) VALUES ('charlie', 'charlie@gmail.com', 'bear');
INSERT INTO users (username, email_address, password) VALUES ('alex' 'alex@gmail.com', 'rabbit');


INSERT INTO peeps (content, time, user_id) VALUES ('I love games', 2022-05-27 13:00:01, 1);
INSERT INTO peeps (content, time, user_id) VALUES ('I love golf', 2022-05-28 14:10:11, 1);
INSERT INTO peeps (content, time, user_id) VALUES ('I love football', 2021-10-14 15:20:31, 2);
INSERT INTO peeps (content, time, user_id) VALUES ('I love cars', 2020-08-12 08:09:50, 3);

3. Define the class names

class Peep
end

class PeepRepository
end

class User
end

class UserRepository
end

4. Implement the Model class

class Peep
  attr_accessor :id, :content, :time, :user_id
end

class User
  attr_accessor :id, :username, :email_address, :password
end

5. Define the Repository Class interface

class UserRepository
  def all
    # 'SELECT id, username, email_address, password FROM users;'
    # Returns an array of User objects.
  end

  def create(user)
    #  'INSERT INTO users (username, email_address, password) VALUES ($1, $2, $3);'
    # Creates a new User object
  end
end

class PeepRepository
    def all
      # 'SELECT id, content, time, user_id FROM peeps;'
      # Returns an array of Peep objects.
    end
  
    def create(peep)
      # 'INSERT INTO peeps (content, time, user_id) VALUES ($1, $2, $3);'
      # Creates a new Peep object
    end
  end
  
6. Write Test Examples

# 1 get all users

it 'returns all users' do
    repo = UserRepository.new

    users = repo.all
    
    expect(users.length).to eq(3)
    expect(users.first.username).to eq('ollie')
  end

  #2 create a new user

  it 'creates a user' do
    repo = UserRepository.new

    user = User.new
    user.username = 'marie'
    user.email_address = 'marie@gmail.com'
    user.password = 'koala'

    repo.create(user)

    users = repo.all

    expect(users.length).to eq(4)
    expect(users.last.username).to eq('marie')
  end

  #3 return all peeps

  it 'returns all peeps' do
    repo = PeepRepository.new

    peeps = repo.all
    
    expect(peeps.length).to eq(4)
    expect(peeps.first.content).to eq('I love games')
  end

  #4 creates a new peep

  it 'creates a peep' do
    repo = PeepRepository.new

    peep = Peep.new
    peep.content = 'I love bikes'
    peep.time = 2020-08-12 10:19:20
    peep.user_id = 3

    repo.create(peep)

    peeps = repo.all

    expect(peeps.length).to eq(5)
    expect(peeps.last.content).to eq('I love bikes')
  end


7. Reload the SQL seeds before each test run

def reset_chitter_table
  seed_sql = File.read('spec/seeds_chitter.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do 
    reset_chitter_table
  end


  def reset_chitter_table
    seed_sql = File.read('spec/seeds_chitter.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end
  
  describe UserRepository do
    before(:each) do 
      reset_chitter_table
    end

 
8. Test-drive and implement the Repository class behaviour

After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour.