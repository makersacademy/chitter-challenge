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
# Table name: peeps

# Model class
# (in lib/peep.rb)

class Peep
  attr_accessor :id, :time, :contents, :user_id
end
```

## 5. Define the Repository Class interface
```ruby
# Table name: peeps

# Repository class
# (in lib/peep_repository.rb)

require 'date'

class PeepRepository

  def all_peeps
    # order by time in SQL
  end

  def create_peep
    # relay the time of the peep
    # contents of the peep
  end
end
```

## 6. Write Test Examples

```ruby

# 1  - Shows all peeps
repo = PeepRepository.new
peeps = repo.all
expect(peeps.length).to eq(4)
expect(users.last.contents).to eq('User 3 newer post')

```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

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
