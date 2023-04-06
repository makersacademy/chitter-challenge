# {{chitter_database}} Model and Repository Classes Design Recipe

## 2. Create Test SQL seeds

```sql
-- (file: spec/seeds_.sql)

TRUNCATE TABLE peeps, users RESTART IDENTITY;

-- Encrypt passwords using bcrypt
INSERT INTO users (email_address, username, password)
VALUES ('sidra@fake.com', 'sidra_fake', crypt('12345', gen_salt('bf')));
INSERT INTO users (email_address, username, password)
VALUES ('bobby@fake.com', 'bobby_fake', crypt('password', gen_salt('bf')));
INSERT INTO users (email_address, username, password)
VALUES ('tina@fake.com', 'tina_fake', crypt('password123', gen_salt('bf')));

INSERT INTO peeps (time, contents, user_id) VALUES ('2023-12-04 12:03:00', 'This is my post, 1');
INSERT INTO peeps (time, contents, user_id) VALUES ('2023-13-04 13:03:00', 'Here is my new post, 2');
INSERT INTO peeps (time, contents, user_id) VALUES ('2023-14-04 13:03:00', 'Here is my other post, 1');
INSERT INTO peeps (time, contents, user_id) VALUES ('2023-15-04 13:03:00', 'User 3 newer post, 3');

```
```bash
psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql
```

## 4. Implement the Model class

```ruby
# Table name: user

# Model class
# (in lib/user.rb)

class User
  attr_accessor :id, :email_address, :user_name, :password
end
```

## 5. Define the Repository Class interface
```ruby
# Table name: users

# Repository class
# (in lib/user_repository.rb)

class UserRepository

  def create(new_user)
    encrypted_password = BCrypt::Password.create(new_user.password)

    sql = '
      INSERT INTO users (email_address, user_name, password)
        VALUES($1, $2, $3);
    '
    sql_params = [
      new_user.email_address,
      new_user.user_name
      encrypted_password
    ]

    result_set = DatabaseConnection.exec_params(sql, sql_params)

    return new_user
  end

  def find_by_email(email)
        sql = 'SELECT id, email_address, user_name, password FROM users WHERE email_address = $1;'
        result_set = DatabaseConnection.exec_params(sql, [email_address])
  end

  def create(student)
  end
end
```

## 6. Write Test Examples

```ruby
# EXAMPLES

# 1  - Shows all users

repo = UserRepository.new
users = repo.all
expect(users.length).to eq(3)
expect(users.first.user_name).to eq('sidra_fake')

# 2 - Find a user by email
repo = UserRepository.new
user = repo.find('sidra@fake.com')

expect(user.username).to eq('sidra_fake')

# 3 - Create a new user 

repo = UserRepository.new

new_user = User.new
new_user.email_address = 'angel@fake.com'
new_user.username = 'angel_fake'
new_user.password = 'password123' # set the plaintext password

encrypted_password = BCrypt::Password.create(new_user.password)
new_user.password = encrypted_password # set the encrypted password

repo.create(new_user)


```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# file: spec/student_repository_spec.rb

def reset_students_table
  seed_sql = File.read('spec/seeds_students.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'students' })
  connection.exec(seed_sql)
end

describe StudentRepository do
  before(:each) do 
    reset_students_table
  end
end
```

## 8. Test-drive and implement the Repository class behaviour

<!-- BEGIN GENERATED SECTION DO NOT EDIT -->
