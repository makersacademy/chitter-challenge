def empty_database
  @connection.exec('
    TRUNCATE users;
    TRUNCATE peeps;
  ')
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

def add_test_peeps
  test_peep_1 = Peep.create(
    :message => "Some test words",
    :user_name => 0,
    :created_at => '2018-05-12 18:17:23 +0100'
  )
  test_peep_2 = Peep.create(
    :message => "More test words",
    :user_name => 0,
    :created_at => '2018-05-12 18:17:25 +0100'
  )
  test_peep_3 = Peep.create(
    :message => "MORE TESTING!?!?!",
    :user_name => 0,
    :created_at => '2018-05-12 18:18:24 +0100'
  )
  @test_peeps = [test_peep_1, test_peep_2, test_peep_3]
end

def log_in
  fill_in 'login_email', with: User.all[0].email
  click_button 'Login'
end

def add_test_users_and_login
  add_test_users_directly
  visit '/'
  log_in
end
