def empty_database
  @connection.exec('TRUNCATE users;')
end

def add_test_users_directly
  @connection.exec("
    INSERT INTO users VALUES(DEFAULT, 'bob@testing.com');
    INSERT INTO users VALUES(DEFAULT, 'fred@testing.com');
  ")
end

def add_test_users
  test_user_1 = User.create(:email => 'bob@testing.com')
  test_user_2 = User.create(:email => 'fred@testing.com')
  @test_users = [test_user_1, test_user_2]
end
